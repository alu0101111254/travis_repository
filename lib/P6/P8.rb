require "P6/P6"
require "P6/P7"

class BasicPlato
  include Comparable

  attr_reader :name, :list, :grams
    def initialize(name , list, grams)
      @name=name
      @list=list
      @grams=grams
    end

    def vct
      en_val=0
      @list.each do |var|
        en_val+=var.val_en
      end
      return en_val
    end

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

    def prot
      tot_prot=0.0
      @list.each do |var|
        tot_prot+=var.proteins
      end
      per_prot=(tot_prot*100.0)/(total_nutr)
      return(per_prot)
    end

    def lipid
      tot_lip=0.0
      @list.each do |var|
        tot_lip+=var.lipids
      end
      per_lip=(tot_lip*100.0)/(total_nutr)
      return(per_lip)
    end

    def carbs
      tot_carb=0.0
      @list.each do |var|
        tot_carb+=var.carbos
      end
      per_carb=(tot_carb*100.0)/(total_nutr)
      return(per_carb)
    end

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

class Plato < BasicPlato

  def initialize(name , list, grams)
    super(name , list, grams)
  end

  def gei_diario
    gei=0
    @list.each do |var|
      gei+=var.gei
    end
    return(gei)
  end

  def terrain
    terrain=0
    @list.each do |var|
      terrain+=var.terrain
    end
    return(terrain)
  end

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
