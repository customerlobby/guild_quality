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

  def self.client(options = {})
    Client.new(options)
  end
end
