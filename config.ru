# frozen_string_literal: true

require_relative 'config/environment'

use Rack::ConditionalGet
use Rack::ETag

use Rack::Static,
    root: File.expand_path('../static', __FILE__),
    urls: [],
    index: 'index.html'

run API::Base
