#clase plato dsl
class PlatoDSL
  attr_accessor :name, :ingredientes, :pesos
#constructor
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
#string formateado del plato
  def to_s
    output = @name
    output << "\nIngredientes:"

    @ingredientes.zip(@pesos).each do |alimento, peso|
      output << "\n  " << alimento.to_s
      output << "\n   Peso: " << peso.to_s
    end

    output
  end

#ingrediente del plato
  def alimento(options = {})
    @ingredientes << options[:name] if options[:name]
    @pesos << options[:peso] if options[:peso]
  end

#nombre del plato
  def nombre(name)
    @name=name
  end

end
#clase menú
class Menu
  attr_accessor :nombre, :descripcion, :platos, :precios
#constructor
  def initialize(nombre,&block)
    @nombre=nombre
    @descripcion=""
    @platos=[]
    @descripciones=[]
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
#añade una descripción al menú
  def descripcion(desc )
   @descripcion=desc
 end
#Añade un plato al menú
 def componente(options = {})
   @platos << options[:nombre] if options[:nombre]
   @descripciones << options[:descripcion] if options[:descripcion]
   @precios << options[:precio] if options[:precio]
 end

 # def valores_nutricionales (options = {})
 #   @prot= options[:proteinas] if options[:proteinas]
 #   @lipids= options[:lipidos] if options[:lipidos]
 #   @carbs= options[:carbohidratos] if options[:carbohidratos]
 # end
 #
 # def valores_ambientales (options = {})
 #   @gei= options[:gei] if options[:gei]
 #   @terrain= options[:terreno] if options[:terreno]
 # end


#devuelve un plato
  def get_plato(index)
    return @platos[index]
  end
#devuelve el precio de un plato concreto
  def get_precio(index)
    return @precios[index]
  end
#devuelve el precio total del menú
  def precio_total()
    precio=0
    @precios.each do |val|
      precio+=val
    end
    return precio
  end

#Devuelve El menú en un string formateado
  def to_s()

    output_string="Menu "+ @nombre + " " + precio_total().to_s() +" €\n"
    output_string+="Descripcion: " + @descripcion + "\nPlatos:"
    vctt=0.0
    geit=0.0
    terrt=0.0
    @platos.zip(@precios, @descripciones).each do |plato, precio, descripcion |
      output_string<< "\n " << plato.name << "  " << precio.to_s() << " €\n"
      output_string<< "   " << descripcion << "\n"
      output_string<< "   VCT: "<< plato.vct.to_s << "\n   GEI: " << plato.gei_diario.to_s << "  Terreno: " << plato.terrain.to_s

      vctt+=plato.vct
      geit+=plato.gei_diario
      terrt+=plato.terrain

    end
    output_string << "\n\nVCT TOTAL:  " << vctt.to_s
    output_string << "\nValores ambientales totales:\n GEI: " << geit.to_s << " Terreno: " << terrt.to_s
    return output_string
  end

end
