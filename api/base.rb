# frozen_string_literal: true

module API
  # Base API mounts the different API versions (currently APIv1)
  class Base < Grape::API
    mount APIv1::Base
  end
end
