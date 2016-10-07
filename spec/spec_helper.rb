require 'chefspec'
require 'chefspec/berkshelf'
require 'rspec/mocks'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '12.04'
end
