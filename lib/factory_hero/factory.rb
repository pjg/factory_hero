class Factory

  attr_reader :default_attributes
  attr_reader :symbol

  def initialize symbol, options = {}, &block
    @symbol = symbol
    @default_attributes  = {}
    @options = options

    set_class

    instance_eval(&block) if block_given?
  end

  def build attrs = {}
    build_object.tap do |obj|
      assign_default_attributes
      assign_custom_attributes attrs
    end
  end

  # used to assign default attributes
  def method_missing(method, *args)
    @default_attributes[method] = args.first
  end

  private

  attr_reader :options, :object, :klass

  def build_object
    @object = klass.new
  end

  def set_class
    set_class_from_options || set_class_from_symbol
  end

  def set_class_from_options
    @klass = options[:class]
  end

  def set_class_from_symbol
    @klass = Object::const_get symbol.to_s.capitalize
  end

  def assign_default_attributes
    default_attributes.each do |attribute, value|
      object.public_send "#{ attribute }=", value
    end
  end

  def assign_custom_attributes attrs
    attrs.each do |attribute, value|
      object.public_send "#{ attribute }=", value
    end
  end

end