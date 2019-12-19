require "P6/P6"
require "P6/P7"

#Clase palto padre, contiene una lista de alimentos
#@author Lucas Christian Bodson Lobato
#@see Alimento
#@see Lista
#@attr_reader name devuelve el nombre del Plato
#@attr_reader list devuelve la lista de alimentos que forman el Plato
#@attr_reader grams devuelve la lista conteniendo el peso de los alimentos de list
class BasicPlato
  include Comparable

  attr_reader :name, :list, :grams
    #Conntructor, requiere un string con el nombre del palto, una lista de alimentos y una lista de gramos
    def initialize(name , list, grams)
      @name=name
      @list=list
      @grams=grams
    end

    #Metodo para calcular el vct o valor energetico total de un Plato
    #@return un float con el vct
    def vct
      en_val=0
      @list.each do |var|
        en_val+=var.val_en
      end
      return en_val
    end

    #Metodo de comparacion entre platos, utiliza el vct de los platos para comparar, si es menor que el plato other devuelve -1, 0 si es igual y 1 si es mayor, es necesario para usar los metodos del mixin comparable
    def <=>(other)
      return vct <=> other.vct
    end

    #total de gramos de lipidos, carbohidratos y proteinas
    def total_nutr
      tot_gram=0.0
      @list.each do |var|
        tot_gram+=var.proteins
        tot_gram+=var.lipids
        tot_gram+=var.carbos
      end
      return tot_gram
    end

    #Devuelve el peso total de las proteinas del plato en gramos 
    def prot
      tot_prot=0.0
      @list.each do |var|
        tot_prot+=var.proteins
      end
      per_prot=(tot_prot*100.0)/(total_nutr)
      return(per_prot)
    end

    #Devuelve el peso total de los lipidos del plato en gramos 
    def lipid
      tot_lip=0.0
      @list.each do |var|
        tot_lip+=var.lipids
      end
      per_lip=(tot_lip*100.0)/(total_nutr)
      return(per_lip)
    end

    #Devuelve el peso total de los carbohidratos del plato en gramos 
    def carbs
      tot_carb=0.0
      @list.each do |var|
        tot_carb+=var.carbos
      end
      per_carb=(tot_carb*100.0)/(total_nutr)
      return(per_carb)
    end

    #Devuelve un string conteniendo todos los to_s de los alimentos de un plato y la informacion adicional del plato formateada
    def to_s
      resultado=""
      resultado+="Nombre: "+@name+ "\n"
      resultado+="alimentos: \n"
      @list.each do |var|
        resultado+=var.to_s
        resultado+="\n"
      end
      resultado+="pesos: \n"
      @grams.each do |var|
        resultado+=var.to_s
        resultado+="\n"
      end
      resultado+="porcentaje proteinas: "+ prot.to_s + " \n"
      resultado+="porcentaje lipidos: "+ lipid.to_s + " \n"
      resultado+="porcentaje carbohidratos: "+ carbs.to_s + " \n"
      resultado+="VCT: "+ vct.to_s + " \n"
    end

end

#Clase plato hijo, contiene todos los elementos de plato padre, pero con nuevos metodos, y metodos sobrecargados como el to_s y <=>
#@see BasicPlato
#@author Lucas Christian Bodson Lobato
class Plato < BasicPlato

  #Constructor, simplemente usa el contructor de BasicPlato
  def initialize(name , list, grams)
    super(name , list, grams)
  end

  #Devuelve el gei generado para cultivar todos los alimentos de un plato
  def gei_diario
    gei=0
    @list.each do |var|
      gei+=var.gei
    end
    return(gei)
  end

  #Devuelve el terreno necesario para cultivar todos los alimentos de un plato
  def terrain
    terrain=0
    @list.each do |var|
      terrain+=var.terrain
    end
    return(terrain)
  end

  #Devuelve la huella nutricional de un plato, se calcula haciendo la media de la huella nuitricional de todos los alimentos de este
  def huella_nutricional
      
      impacto_kcal=0.0
      impacto_gei=0.0
      
      if (gei_diario*1000)<800 then impacto_gei=1.0
      elsif (gei_diario*1000)<1200 then impacto_gei=2.0
      else impacto_gei=3.0
      end

      if vct<670 then impacto_kcal=1.0
      elsif vct<830 then impacto_kcal=2.0
      else impacto_kcal=3.0
      end

      return (impacto_gei+impacto_kcal)/2
  end

  #Metodo de comparacion entre platos,hace lo mismo que en la clase padre pero usando huella_nutricional es necesario para usar los metodos del mixin comparable
  #@see BasicPlato
  def <=>(other)
    return huella_nutricional <=> other.huella_nutricional
  end

  #Devuelve un string conteniendo todos los to_s de los alimentos de un plato y la informacion adicional del plato formateada, incluyendo el gei y el terreno
  def to_s
    resultado=""
    resultado+="Nombre: "+@name+ "\n"
    resultado+="alimentos: \n"
    @list.each do |var|
      resultado+=var.to_s
      resultado+="\n"
    end

    resultado+="pesos: \n"
    @grams.each do |var|
      resultado+=var.to_s
      resultado+="\n"
    end

    resultado+="porcentaje proteinas: "+ prot.to_s + " \n"
    resultado+="porcentaje lipidos: "+ lipid.to_s + " \n"
    resultado+="porcentaje carbohidratos: "+ carbs.to_s + " \n"
    resultado+="VCT: "+ vct.to_s + " \n"
    resultado+="GEI: "+ gei_diario.to_s + " \n"
    resultado+="Terrain: "+ terrain.to_s + " \n"

  end
end
