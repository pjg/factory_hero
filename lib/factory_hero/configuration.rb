class Configuration

  attr_reader :factories

  def initialize
    @factories = []
  end

  def register_factory factory
    delete_existing factory.symbol

    factories << factory
  end

  def load_factory symbol
    factories.detect ifnone = -> { raise_exception symbol } do |factory|
      factory.symbol == symbol
    end
  end

  def clear!
    factories.clear
  end

  private

  def delete_existing symbol
    factories.delete_if { |factory| factory.symbol == symbol }
  end

  def raise_exception symbol
    raise UndefinedFactory.new(symbol), 'No factory definition with this name'
  end

end
