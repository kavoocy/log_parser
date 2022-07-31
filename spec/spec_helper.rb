
# require 'rspec/rails'
# require 'capybara'
# require 'capybara/dsl'
require 'rspec/core'
# require 'capybara/rspec/matchers'
# require 'capybara/rspec/features'
# require 'capybara/rspec'
require "pry"

Dir["./lib/**/*.rb"].each { |file| require file }
Dir[File.expand_path("support/**/*.rb", __dir__)].each { |rb| require(rb) }

