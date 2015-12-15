require 'rubygems'
require 'factory_girl'
require 'rspec'
require 'rubytypeformio'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
