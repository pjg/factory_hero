require 'pry'
require 'factory_hero'

require_relative 'fixtures/user'

RSpec.configure do |config|
  config.before do
    FactoryHero.clear!
  end
end
