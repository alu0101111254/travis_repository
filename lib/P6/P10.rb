
class PlatoDSL
  attr_accessor :name, :ingredientes, :pesos

  def initialize( &block)
    @name
    @ingredientes = []
    @pesos = []

    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end
  end

  def to_s
    output = @name
    output << "\nIngredients:\n\n"

    @ingredientes.zip(@pesos).each do |alimento, peso|
      output << "\n " << alimento
      output << "\n Peso: " << peso.to_s
    end

    output
  end

  def alimento(options = {})
    @ingredientes << options[:name] if options[:name]
    @pesos << options[:peso] if options[:peso]
  end

  def nombre(name)
    @name=name
  end

end
