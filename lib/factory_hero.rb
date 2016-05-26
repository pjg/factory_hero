require 'factory_hero/configuration'
require 'factory_hero/exceptions'
require 'factory_hero/factory'
require 'factory_hero/symbolize'
require "factory_hero/version"

module FactoryHero

  using Symbolize

  def self.configuration
    @@configuration ||= Configuration.new
  end

  def self.define_factory klass_or_symbol, options = {}, &block
    symbol = klass_or_symbol.symbolize

    configuration.register_factory Factory.new symbol, options, &block
  end

  def self.build klass_or_symbol, attrs = {}
    symbol = klass_or_symbol.symbolize
    factory = configuration.load_factory symbol

    factory.build attrs
  end

  def self.clear!
    configuration.clear!
  end

end
