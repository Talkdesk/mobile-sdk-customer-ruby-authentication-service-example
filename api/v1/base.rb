# frozen_string_literal: true

module APIv1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'msdk-server-sample'
    format :json

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error_message = {
        "code": 29_100,
        "message": 'Error validating parameters',
        "fields": e.full_messages.map do |m|
          {
            "name": m.split.first,
            "description": m
          }
        end
      }
      error!(error_message, 400)
    end

    mount APIv1::Token

    add_swagger_documentation api_version: 'v1',
                              info: {
                                title: 'Mobile SDK sample API',
                                description: 'Documentation for version 1 API'
                              }
  end
end
