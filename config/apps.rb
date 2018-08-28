# frozen_string_literal: true

module Registry
  # Represents an iOS app and its push parameters
  class IOSApp
    attr_reader :platform
    attr_reader :bundle_id

    def initialize(bundle_id)
      @platform = 'ios'
      @bundle_id = bundle_id
    end
  end

  APPS = {
    'example-app-ios' => IOSApp.new('com.example.app')
  }.freeze
end
