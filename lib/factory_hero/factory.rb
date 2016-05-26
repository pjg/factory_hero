class Factory

  attr_reader :default_attributes, :symbol

  def initialize symbol, options = {}, &block
    @symbol = symbol
    @default_attributes  = {}
    @options = options

    instance_eval(&block) if block_given?
  end

  def build attributes = {}
    build_object.tap do |obj|
      assign_attributes default_attributes
      assign_attributes attributes
    end
  end

  # used to assign default attributes
  def method_missing(method, *args)
    @default_attributes[method] = args.first
  end

  private

  attr_reader :options, :object

  def build_object
    @object = klass.new
  end

  def klass
    @klass ||= class_from_options || class_from_symbol
  end

  def class_from_options
    options[:class]
  end

  def class_from_symbol
    Object::const_get symbol.to_s.capitalize
  end

  def assign_attributes attributes
    attributes.each do |attribute, value|
      object.public_send "#{ attribute }=", value
    end
  end

end
