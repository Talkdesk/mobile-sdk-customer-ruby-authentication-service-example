# frozen_string_literal: true

require 'json'
require './lib/td_jwt'
require './config/apps'

module APIv1
  # API to fetch tokens from Talkdesk ID for a given Application
  # as registered in /config/apps.rb
  class Token < Grape::API
    format :json

    desc 'Request a new token',
         success: { code: 201, message: 'Created authorization (access token) for application' }

    params do
      requires :app_id, type: String
    end

    http_basic do |username, password|
      if username.nil? || password.nil?
        false
      else
        { ENV['DEFAULT_USERNAME'] => ENV['DEFAULT_PASSWORD'] }[username] == password
      end
    end

    post '/token/:app_id/' do
      app = Registry::APPS[params[:app_id]]

      error! :not_found, 404 unless app

      status :created
      { 'auth_token': TD::MediaSession.access_token }
    end
  end # Token
end # APIv1
