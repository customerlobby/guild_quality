require "json"
require "guild_quality/version"
require "guild_quality/client"

module GuildQuality
  class Error < StandardError; end

  # 401
  class AuthorizationError < Error; end

  # 400
  class BadRequestError < Error; end

  # 422
  class InvalidRequestDataError < Error; end


  # Create API client
  #
  # @param options [Hash] Client options
  # @option options [String] :api_key API Key.
  # @option options [String] :endpoint Guild Quality api endpoint.
  #   Default is "https://www.guildquality.com"
  # @option options [String] :api_version API Version. Default "v3"
  # @option options [String] :api_version API Version.
  # @option options [String] :faraday_adapter Fraday adapter. Default is 'net_http'
  # @return [GuildQuality::Client] API client.
  def self.client(options = {})
    Client.new(options)
  end
end
