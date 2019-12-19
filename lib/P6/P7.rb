require_relative 'P6'
#Clase nodo, contiene un valor, el nodo siguiente y el nodo previo
#@attr value Valor contenido en el nodo
#@attr next Nodo siguiente al actual
#@attr prev nodo previo al actual
Node = Struct.new(:value, :next, :prev)

#Clase lista, es una lista doblemente enlazada formada por nodos de la clase node
#@author Lucas Christian Bodson Lobato
#@attr_reader head Devuelve el nodo  cabeza de la Lista
#@attr_reader tail Devuelve el nodo cola de la Lista
class Lista
  attr_reader :head, :tail
  include Enumerable

  #Constructor, requiere dos elementos, cabeza y cola, si la cola es de un solo elemento se puede poner nil en uno de los dos
  def initialize(head, tail)
    if head==nil && tail!=nil then
      @head=tail
      @tail=tail
    end
    if head!=nil && tail==nil then
      @head=head
      @tail=head
    end
    @head=head
    @tail=tail
  end

  #Metodo de insercion por la cabeza, el elemento insertado se convierte en la nueva cabeza, y la previa cabeza es el next de este
  def insert(value)
    if (head==nil) then
      @head=Node.new(value,nil,nil)
      @tail=@head
    else
      temp=Node.new(value,nil,@tail)
      @tail.next=temp
      @tail=temp
    end
  end

  #Metodo de insercion por cola, el elemento insertado se vuelve la cola, y la cola previa es el prev de este
  def insert_back(value)
    if (head==nil) then
      @head=Node.new(value,nil,nil)
      @tail=@head
    else
      temp=Node.new(value,@head,nil)
      @head.prev=temp
      @head=temp
    end
  end

  #Método para extrar la cabeza, se saca la cabeza de la lista, y el prev de esta se vuelve la nueva cabeza
  #@return devuelve la cabeza extraída 
  def extract_h()
    temp=@head
    @head=@head.next
    if @head!=nil then
      @head.prev=nil
    end
    if @head==nil then
      @tail=nil
    end
    return temp
  end

  #Método para extrar la cola, se saca la cola de la lista, y el next de esta se vuelve la nueva cola
  #@return devuelve la cola extraída 
  def extract_t()
    temp=@tail
    temp=@tail
    @tail=@tail.prev
    if @tail!=nil then
      @tail.next=nil
    end
    if @tail==nil then
      @head=nil
    end
    return temp
  end

  #Devuelve un string conteniendo todos los to_s de los elementos de cada nodo
  def to_s()
    result=""
    each do |nodo|
      result+=nodo.to_s + "\n"
    end
    return result
  end

  #Metodo each, es un metodo que sirve para iterar por todos los elementos de la lista, es necesario para el funcionamiento de los mixins de Enumerable
  def each
    nodo=@head
    while (nodo!=nil ) do
      yield nodo.value
      nodo=nodo.next
    end
  end
end


 #metodo para encontrar el peso de los nutrientes de un alimento
def tt_f(b)
  b.proteins+b.carbos+b.lipids

end

#algoritmo para encontrar dietas con porcentajes objetivo
#@return Devuelve una lista con alimentos que en combinacion cumplen con los porcentajes objetivo
def algoritmo(prot,gras,carb)
  pp=prot
  pl=gras
  pc=carb

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
    if(((pp-tpp).abs < 3)&&((pl-tpl).abs < 3)&&((pc-tpc).abs < 3))
      aprox=true
    end

  end
  #mostrar la dieta
  #puts "proteinas " + tpp.to_s
  #puts "carbos " + tpc.to_s
  #puts "grasas " + tpl.to_s
  #puts "gramos " + tt.to_s

  for i in 0...b.size do

    #puts b[i].to_s
  end
  return b
end

#Mismo algoritmo que algoritmo pero con elementos base vegetarianos
#@see algoritmo
def algoritmo_vegetariano(prot,gras,carb)
  pp=prot
  pl=gras
  pc=carb

  a=[]

  a << Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
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
    if(((pp-tpp).abs < 3)&&((pl-tpl).abs < 3)&&((pc-tpc).abs < 3))
      aprox=true
    end

  end
  #mostrar la dieta
  #puts "proteinas " + tpp.to_s
  #puts "carbos " + tpc.to_s
  #puts "grasas " + tpl.to_s
  #puts "gramos " + tt.to_s

  for i in 0...b.size do

    #puts b[i].to_s
  end
  return b
end

#Mismo algoritmo que algoritmo pero con elementos base vegetalianos o veganos
#@see algoritmo
def algoritmo_vegetaliano(prot,gras,carb)
  pp=prot
  pl=gras
  pc=carb

  a=[]

  a << Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
  a << Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
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
    if(((pp-tpp).abs < 3)&&((pl-tpl).abs < 3)&&((pc-tpc).abs < 3))
      aprox=true
    end

  end
  #mostrar la dieta
  #puts "proteinas " + tpp.to_s
  #puts "carbos " + tpc.to_s
  #puts "grasas " + tpl.to_s
  #puts "gramos " + tt.to_s

  for i in 0...b.size do

    #puts b[i].to_s
  end
  return b
end
