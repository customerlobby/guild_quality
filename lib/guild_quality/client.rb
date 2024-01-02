require "faraday"
require "faraday_middleware"
require "json"
require "guild_quality/faraday_middleware/auth"

module GuildQuality
  class Client
    ENDPOINT = "https://www.guildquality.com".freeze
    API_VERSION = "v3".freeze

    attr_accessor :api_key, :endpoint, :api_verion, :faraday_adapter, :logger

    def initialize(options)
      self.api_key = options[:api_key]
      self.endpoint = options[:endpoint] || ENDPOINT
      self.api_verion = options[:api_verion] || API_VERSION
      self.faraday_adapter = options[:faraday_adapter] || Faraday.default_adapter
      self.logger = options[:logger]
      @connection = nil
    end

    # Create customer.
    # GuildQuality will create or update customer based on email.
    # Doc: https://documenter.getpostman.com/view/2124402/TVRecqCj#80c0996d-50b6-4365-b4d6-c8aeb2ccb069
    def create_customer(data)
      request(:post, request_prefix_prefix("customer"), { body: data })
    end

    private

    def request_prefix_prefix(path)
      "/company-api/#{self.api_verion}/#{path}"
    end

    def connection
      @connection ||= Faraday.new({ url: self.endpoint }) do |conn|
        conn.headers["Content-Type"] = "application/json"
        conn.use GuildQuality::FaradayMiddleware::Auth, api_key
        conn.response :logger, logger if self.logger
        conn.adapter(self.faraday_adapter)
      end
    end

    def request(method, path, options)
      http_response = connection.send(method) do |request|
        case method
        when :get, :delete
          request.params = options[:params] if options[:params]
          request.url(path, options)
        when :post, :put
          request.headers["Content-Type"] = "application/json"
          request.body = options[:body].to_json if options[:body]
          request.params = options[:params] if options[:params]
          request.url(path)
        end
        request.options.timeout = 120 # read timeout
        request.options.open_timeout = 300 # connection timeout
      end

      if http_response.status == 200
        begin
          return JSON.parse(http_response.body)
        rescue => e
          return {}
        end
      end

      raise AuthorizationError, http_response.body if http_response.status == 401

      raise BadRequestError, http_response.body if http_response.status == 400

      raise InvalidRequestDataError, http_response.body if http_response.status == 422

      raise RateLimitError, http_response.body if http_response.status == 429

      raise Error, http_response.body
    end
  end
end
