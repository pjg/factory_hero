require 'spec_helper'

describe FactoryHero do
  let(:factory_class) { User }
  let(:factory_symbol) { :user }

  it 'builds an instance of the factory object' do
    FactoryHero.define_factory factory_class

    expect(FactoryHero.build(factory_class)).to be_an_instance_of factory_class
  end

  it 'allows defining a factory using symbol instead of a class name' do
    FactoryHero.define_factory factory_symbol

    expect(FactoryHero.build(factory_class)).to be_an_instance_of factory_class
  end

  it 'allows defining a factory using symbol and build a factory using symbol' do
    FactoryHero.define_factory factory_symbol

    expect(FactoryHero.build(factory_symbol)).to be_an_instance_of factory_class
  end

  it 'allows assigning custom attributes' do
    attrs = { name: 'foobar' }
    FactoryHero.define_factory factory_class

    user = FactoryHero.build factory_class, attrs

    expect(user.name).to eql attrs[:name]
  end

  it 'allows assigning default attributes' do
    FactoryHero.define_factory factory_class do
      name 'foobar'
    end

    user = FactoryHero.build factory_class

    expect(user.name).to eql 'foobar'
  end

  it 'allows defining a class of the used factory as an attribute' do
    factory_symbol = :admin
    options = { class: factory_class }

    FactoryHero.define_factory factory_symbol, options do
      name 'foobar'
      admin true
    end

    admin = FactoryHero.build factory_symbol

    expect(admin.name).to eql 'foobar'
    expect(admin.admin).to be_truthy
  end

  it 'allows clearing all defined factories' do
    FactoryHero.define_factory factory_class do
      name 'foobar'
    end

    FactoryHero.clear!

    expect { FactoryHero.build factory_class }.to raise_exception
  end

end
