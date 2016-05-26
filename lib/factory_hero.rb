require 'factory_hero/configuration'
require 'factory_hero/factory'
require "factory_hero/version"

module FactoryHero

  def self.configuration
    @@configuration ||= Configuration.new
  end

  def self.define_factory klass_or_symbol, options = {}, &block
    symbol = klass_or_symbol.to_s.downcase.to_sym

    configuration.register_factory Factory.new symbol, options, &block
  end

  def self.build klass_or_symbol, attrs = {}
    symbol = klass_or_symbol.to_s.downcase.to_sym
    factory = configuration.load_factory symbol

    factory.build attrs
  end

end
