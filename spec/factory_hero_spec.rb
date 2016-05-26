require 'spec_helper'

describe FactoryHero do
  let(:klass) { User }
  let(:symbol) { :user }

  it 'builds an instance of the factory object' do
    FactoryHero.define_factory klass

    expect(FactoryHero.build(klass)).to be_an_instance_of klass
  end

  it 'allows defining a factory using symbol instead of a klass name' do
    FactoryHero.define_factory symbol

    expect(FactoryHero.build(klass)).to be_an_instance_of klass
  end

  it 'allows defining a factory using symbol and build a factory using symbol' do
    FactoryHero.define_factory symbol

    expect(FactoryHero.build(symbol)).to be_an_instance_of klass
  end

  it 'allows assigning custom attributes' do
    attrs = { name: 'foobar' }
    FactoryHero.define_factory klass

    user = FactoryHero.build klass, attrs

    expect(user.name).to eql attrs[:name]
  end

  it 'allows assigning default attributes' do
    FactoryHero.define_factory klass do
      name 'foobar'
    end

    user = FactoryHero.build klass

    expect(user.name).to eql 'foobar'
  end

  it 'allows defining a class of the used factory as an attribute' do
    symbol = :admin
    options = { class: klass }

    FactoryHero.define_factory symbol, options do
      name 'foobar'
      admin true
    end

    admin = FactoryHero.build symbol

    expect(admin.name).to eql 'foobar'
    expect(admin.admin).to be_truthy
  end

end
