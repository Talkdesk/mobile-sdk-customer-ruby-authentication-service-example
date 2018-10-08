# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

# The following variables are required for this quickstart,
# for local development you can set them in a .env file
# for prodution you might want to set them using your provider ui or tools.

# - - - - - - - -
# Talkdesk Account Configuration (see: https://docs.talkdesk.com/docs/auth )
# - - - - - - - -

ENV['TD_ACCOUNT_NAME'] ||= raise ArgumentError,
                                 'Talkdesk Account name not specified'

ENV['TD_CLIENT_ID'] ||= raise ArgumentError,
                              'No Client ID specifief'

ENV['TD_KEY_ID'] ||= raise ArgumentError,
                           'No Key ID, see: '\
                           'https://docs.talkdesk.com/docs/using-a-signed-jwt'

ENV['TD_PRIVATE_KEY'] ||= raise ArgumentError,
                                'No Private Key, see: '\
                                'https://docs.talkdesk.com/docs/using-a-signed-jwt'

# - - - - - - - -
# Sample User Configuration
# - - - - - - - -

ENV['DEFAULT_USERNAME'] ||= raise ArgumentError,
                                  'Default username required '\
                                  '(or proper auth implementation)'

ENV['DEFAULT_PASSWORD'] ||= raise ArgumentError,
                                  'Default password required '\
                                  '(or proper auth implementation)'

require_relative 'application'
