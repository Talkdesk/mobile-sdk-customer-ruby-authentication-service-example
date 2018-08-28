# frozen_string_literal: true

require 'json'
require 'uri'
require 'net/http'
require './lib/td_jwt'

class TDMediaSessionError < StandardError
end

module TD
  # Manage MediaSessions authorizations
  class MediaSession
    # rubocop: disable MethodLength, LineLength
    def self.access_token
      oauth_endpoint = "https://#{ENV['TD_ACCOUNT_NAME']}.talkdeskid.com/oauth/token"
      client_assertion = TD::Signed.jwt(oauth_endpoint)
      response = Net::HTTP.post_form(URI(oauth_endpoint),
                                     'grant_type' => 'client_credentials',
                                     'scope' => 'media-sessions:execute',
                                     'client_id' => ENV['TD_CLIENT_ID'],
                                     'client_assertion_type' => 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer',
                                     'client_assertion' => client_assertion)

      response_object = JSON.parse(response.body)

      case response
      when Net::HTTPSuccess
        response_object['access_token']
      else
        raise TDMediaSessionError,
              "Unable to Fetch Access Token for 'mediasession:execute', ",
              "error '#{response_object['error']}'"
      end
    end
  end
  # rubocop: enable MethodLength, LineLength
end
