# frozen_string_literal: true

module APIv1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'msdk-server-sample'
    format :json

    mount APIv1::Token

    add_swagger_documentation api_version: 'v1',
                              info: {
                                title: 'Media Session Authorization API',
                                description: 'A sample API for authorizing Media Sessions '\
                                'for Mobile Apps.'
                              }
  end
end
