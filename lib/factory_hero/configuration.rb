class Configuration

  attr_reader :factories

  def initialize
    @factories = []
  end

  def register_factory factory
    raise_if_exists factory.symbol

    factories << factory
  end

  def load_factory symbol
    factories.detect ifnone = -> { undefined_factory_exception symbol } do |factory|
      factory.symbol == symbol
    end
  end

  def clear!
    factories.clear
  end

  private

  def raise_if_exists symbol
    return unless factories.detect { |factory| factory.symbol == symbol }

    factory_already_defined_exception symbol
  end

  def undefined_factory_exception symbol
    raise UndefinedFactory.new(symbol), 'No factory definition with this name'
  end

  def factory_already_defined_exception symbol
    raise FactoryAlreadyDefined.new(symbol), 'There is already a factory defined with this name'
  end

end
