ENV["RACK_ENV"] ||= "test"

require "bundler"
require "rack/test"

Bundler.require(:defualt, :test)

require File.expand_path(File.join(File.dirname(__FILE__),
                         "..",
                         "fio.rb"))

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end

