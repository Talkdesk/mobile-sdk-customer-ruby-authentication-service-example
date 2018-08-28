# frozen_string_literal: true

require 'json'
require 'jwt'
require 'securerandom'
require './lib/key_helper'

module TD
  # Generate a Signed JWT Authorization Tokens to be used with TD
  # for more information see: https://docs.talkdesk.com/docs/using-a-signed-jwt
  class Signed
    @private_key = ENV['TD_PRIVATE_KEY'].to_pem

    def self.jwt(audience)
      JWT.encode({
                   jti: SecureRandom.uuid,
                   sub: ENV['TD_CLIENT_ID'],
                   iss: ENV['TD_CLIENT_ID'],
                   aud: audience,
                   iat: Time.now.to_i,
                   exp: Time.now.to_i + 5 * 60
                 }, @private_key, 'ES256',
                 kid: ENV['TD_KEY_ID'])
    end
  end
end
