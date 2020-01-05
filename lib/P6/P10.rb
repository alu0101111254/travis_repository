
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

class Menu
  attr_accessor :nombre, :descripcion, :platos, :precios
  def initialize(nombre,&block)
    @nombre=nombre
    @descripcion=""
    @platos=[]
    @precios=[]
    @prot= 0.0
    @lipids= 0.0
    @carbs= 0.0
    @gei= 0.0
    @terrain= 0.0

    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end
  end

  def descripcion(desc )
   @descripcion=desc
 end

 def componente(options = {})
   @platos << options[:descripcion] if options[:descripcion]
   @precios << options[:precio] if options[:precio]
 end

 def valores_nutricionales (options = {})
   @prot= options[:proteinas] if options[:proteinas]
   @lipids= options[:lipidos] if options[:lipidos]
   @carbs= options[:carbohidratos] if options[:carbohidratos]
 end

 def valores_ambientales (options = {})
   @gei= options[:gei] if options[:gei]
   @terrain= options[:terreno] if options[:terreno]
 end

  def get_plato(index)
    return @platos[index]
  end

  def get_precio(index)
    return @precios[index]
  end

  def precio_total()
    precio=0
    @precios.each do |val|
      precio+=val
    end
    return precio
  end

  def to_s()

    output_string="Menu "+ @nombre + " " + precio_total().to_s() +" €\n"
    output_string+="Descripcion: " + @descripcion + " \n Platos:\n"
    @platos.zip(@precios).each do |plato, precio|
      output_string<< "\n " << plato << "  " << precio.to_s() << " € "
    end
    output_string << "\nValores nutricionales: Proteinas: " << @prot.to_s << " Lipidos: " << @lipids.to_s << " Carbohidratos: " << @carbs.to_s
    output_string << "\nValores ambientales: GEI: " << @gei.to_s << " Terreno: " << @terrain.to_s
    return output_string
  end

end
