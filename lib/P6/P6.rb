class Alimento

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

end

Node = Struct.new(:value, :next, :prev)

class Lista
  attr_reader :head
  def initialize()

  end
  def initialize(head)
    @head=head
  end
end

def tt_f(b)
  b.proteins+b.carbos+b.lipids
end
#Porcentajes objetivo
pp=20
pl=40
pc=40

a=[]
a << Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
a << Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
a << Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
a << Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
a << Alimento.new("Salmón", 19.9, 0.0, 13.6, 6.0, 3.7)
a << Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
a << Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
a << Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
a << Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
a << Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
a << Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
a << Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
a << Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
a << Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
a << Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
aprox=false;

tt=tt_f(a[0])
tpp=(a[0].proteins*100)/tt
tpc=(a[0].carbos*100)/tt
tpl=(a[0].lipids*100)/tt
b=[]
b << a[0]
last=0
puts tt_f(a[0])
puts tpp
puts tpc
puts tpl
prot=a[0].proteins
carb=a[0].carbos
lipi=a[0].lipids

#el b.size<10 es para limitar la busqueda si no encuentra combinacion
while aprox!=true && b.size<100 do
  closest=0
  for i in 0...a.size do
    tta=tt+tt_f(a[closest])
    ttb=tt+tt_f(a[i])
    tppa=((a[closest].proteins+prot)*100)/tta
    tppb=((a[i].proteins+prot)*100)/ttb
    tpca=((a[closest].carbos+carb)*100)/tta
    tpcb=((a[i].carbos+carb)*100)/ttb
    tpla=((a[closest].lipids+lipi)*100)/tta
    tplb=((a[i].lipids+lipi)*100)/ttb
    distanceA=(pp-tppa).abs+(pc-tpca).abs+(pl-tpla).abs
    distanceB=(pp-tppb).abs+(pc-tpcb).abs+(pl-tplb).abs
    if distanceA>distanceB && i!=last
      closest=i
    end
  end
  b << a[closest]
  tt=tt+tt_f(a[closest])
  tpp=((a[closest].proteins+prot)*100)/tta
  tpc=((a[closest].carbos+carb)*100)/tta
  tpl=((a[closest].lipids+lipi)*100)/tta
  prot+=a[closest].proteins
  carb+=a[closest].carbos
  lipi+=a[closest].lipids
  last=closest
  #tolerancias
  if(((pp-tpp).abs < 0.4)&&((pl-tpl).abs < 0.4)&&((pc-tpc).abs < 0.4))
    aprox=true
  end
end
puts "proteinas " + tpp.to_s
puts "carbos " + tpc.to_s
puts "grasas " + tpl.to_s
for i in 0...b.size do
  puts b[i].to_s
end
