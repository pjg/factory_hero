require 'spec_helper'

describe Factory do
  let(:factory_class) { User }
  let(:factory_symbol) { :user }
  let(:name) { 'foobar' }

  it 'allows defining a factory without default attributes' do
    factory = Factory.new factory_symbol

    expect(factory.default_attributes).to eql({})
  end

  it 'allows defining a factory with default attributes' do
    factory = Factory.new factory_symbol do
      name 'foobar'
    end

    expect(factory.default_attributes).to eql({ name: 'foobar' })
  end

  it 'allows building new objects with default attributes' do
    factory = Factory.new factory_symbol do
      name 'foobar'
    end

    object = factory.build

    expect(object.name).to eql name
  end

  it 'allows building new objects with custom attributes' do
    name = 'baz'
    factory = Factory.new factory_symbol

    object = factory.build name: name

    expect(object.name).to eql name
  end

  it 'allows specyfing class to use in the factory' do
    factory = Factory.new :admin, class: factory_class

    expect(factory.build).to be_a factory_class
  end

end

