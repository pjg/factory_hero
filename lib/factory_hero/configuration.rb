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
    factories.detect ifnone = -> { raise 'Undefined factory' } do |factory|
      factory.symbol == symbol
    end
  end

  private

  def delete_existing symbol
    factories.delete_if { |factory| factory.symbol == symbol }
  end

end
