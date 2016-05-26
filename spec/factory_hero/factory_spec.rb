require 'spec_helper'

describe Factory do
  let(:klass) { User }
  let(:symbol) { :user }
  let(:name) { 'foobar' }

  it 'allows defining a factory without default attributes' do
    factory = Factory.new symbol

    expect(factory.default_attributes).to eql({})
  end

  it 'allows defining a factory with default attributes' do
    factory = Factory.new symbol do
      name 'foobar'
    end

    expect(factory.default_attributes).to eql({ name: 'foobar' })
  end

  it 'allows building new objects with default attributes' do
    factory = Factory.new symbol do
      name 'foobar'
    end

    object = factory.build

    expect(object.name).to eql name
  end

  it 'allows building new objects with custom attributes' do
    name = 'baz'
    factory = Factory.new symbol

    object = factory.build name: name

    expect(object.name).to eql name
  end

  it 'allows specyfing class to use in the factory' do
    factory = Factory.new :admin, class: klass

    expect(factory.build).to be_a klass
  end

end

