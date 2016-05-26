require 'spec_helper'

describe Configuration do
  let(:symbol) { :user }
  let(:factory) { instance_double Factory, symbol: symbol }
  let(:new_factory) { instance_double Factory, symbol: symbol }
  let(:configuration) { Configuration.new }

  describe '#register_factory' do
    it 'allows registering a factory' do
      configuration.register_factory factory

      expect(configuration.factories).to include factory
    end

    it 'allows re-registering a factory' do
      configuration.register_factory factory
      configuration.register_factory new_factory

      expect(configuration.factories).not_to include factory
      expect(configuration.factories).to include new_factory
    end
  end

  describe '#load_factory' do
    it 'raises if factory does not exist' do
      expect {
        configuration.load_factory :non_existing
      }.to raise_exception UndefinedFactory
    end

    it 'returns existing factory if found' do
      configuration.register_factory factory

      factory = configuration.load_factory symbol

      expect(factory).to eql factory
    end
  end

  describe '#clear' do
    it 'clears all existing factories' do
      configuration.register_factory factory

      configuration.clear!

      expect(configuration.factories).to be_empty
    end
  end
end
