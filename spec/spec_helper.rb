
require "rspec/core"
require "pry"

Dir["./lib/**/*.rb"].each { |file| require file }
Dir[File.expand_path("support/**/*.rb", __dir__)].each { |rb| require(rb) }

RSpec.configure do |config|
  config.include HelperExpectations
end
