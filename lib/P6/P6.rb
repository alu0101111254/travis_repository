class Alimento

  include Comparable
  attr_reader :name, :gei, :terrain, :proteins, :lipids, :carbos
  def initialize(name,proteins,carbos,lipids,gei,terrain)
    @name, @proteins, @carbos, @lipids, @gei, @terrain = name, proteins, carbos, lipids, gei, terrain
  end

  def to_s()
    "Nombre: " + name + " Proteínas: " + @proteins.to_s + " Carbohidratos: " + @carbos.to_s + " Lípidos: " + @lipids.to_s + " GEI: " + gei.to_s + " Terreno: " + terrain.to_s
  end

  def val_en()
    (@carbos*4)+(@lipids*9)+(@proteins*4)
  end

  def <=>(another)
    return val_en <=> another.val_en
  end

end
