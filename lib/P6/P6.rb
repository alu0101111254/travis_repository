# Clase alimento, contiene toda la información nutricional necesaria oara el desarrollo de las practicas   
# @author Lucas Christian Bodson Lobato
# @attr_reader name devuelve el nombre del alimento
# @attr_reader gei devuelve las emisiones de gases diarias de una alimento en kilos
# @attr_reader terrain devuelve el terreno necesario para cultivar el alimento
# @attr_reader carbos devuelve la cantidad de carbohidratos contenidos en el alimento en gramos
# @attr_reader proteins devuelve la cantidad de proteinas contenidos en el alimento en gramos
# @attr_reader lipids devuelve la cantidad de  lipidos contenidos en el alimento en gramos
class Alimento

  include Comparable
  attr_reader :name, :gei, :terrain, :proteins, :lipids, :carbos

  #Construye un objeto alimento segun las especificaciones
  def initialize(name,proteins,carbos,lipids,gei,terrain)
    @name, @proteins, @carbos, @lipids, @gei, @terrain = name, proteins, carbos, lipids, gei, terrain
  end

  #Devuelve todos los valores de alimento formateados como un string
  def to_s()
    "Nombre: " + name + " Proteínas: " + @proteins.to_s + " Carbohidratos: " + @carbos.to_s + " Lípidos: " + @lipids.to_s + " GEI: " + gei.to_s + " Terreno: " + terrain.to_s
  end

  #Devuelve el valor energético del alimento
  def val_en()
    (@carbos*4)+(@lipids*9)+(@proteins*4)
  end

  #Metodo de comparación, devuelve -1 si es menor que other, +1 si es mayor y 0 si es igual, se utiliza para los mixins de comparable
  def <=>(another)
    return val_en <=> another.val_en
  end

end
