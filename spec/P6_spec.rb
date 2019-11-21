RSpec.describe P6 do
  describe Alimento do
    before :each do
      @alimento=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)
    end

    it "has a version number" do
      expect(P6::VERSION).not_to be nil
    end

    it "Has a name" do
      expect(@alimento.name).not_to be nil
    end

    it "Has a GEI" do
      expect(@alimento.gei).not_to be nil
    end

    it "Has a terrain" do
      expect(@alimento.gei).not_to be nil
    end

    it "Existe metodo que devuelve el nombre" do
      expect(@alimento).to respond_to(:name)
    end

    it "Existe metodo que devuelve el gei" do
      expect(@alimento).to respond_to(:gei)
    end

    it "Existe metodo que devuelve el terreno" do
      expect(@alimento).to respond_to(:terrain)
    end

    it "Existe un metodo para obtener el alimento formateado" do
      expect(@alimento).to respond_to(:to_s)
    end

    it "Existe un metodo para obtener el valor energético de el alimento" do
      expect(@alimento).to respond_to(:val_en)
    end
  end

  it "Se calcula correctamente el impacto ambiental de un hombre de 20-39 años" do
    vaca=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)
    choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
    lente=Alimento.new("lentejas", 23.5, 52.0,1.4,0.4,3.4)
    queso=Alimento.new("queso", 25.0,1.3,33.0,11.0,41.0)
    huevo=Alimento.new("huevo", 13.0,1.1,11.0,4.2,5.7)

    expect((vaca.val_en*3)+(choco.val_en*1.35)+(lente.val_en*4)+(queso.val_en*1.5)+(huevo.val_en)).to be >= 3000.0
    expect((vaca.proteins*3)+(choco.proteins*1.35)+(lente.proteins*4)+(queso.proteins*1.5)+(huevo.proteins)).to be >= 54.0
    expect((vaca.gei*3)+(choco.gei*1.35)+(lente.gei*4)+(queso.gei*1.5)+(huevo.gei)).to eq(175.40499999999997)
    expect((vaca.terrain*3)+(choco.terrain*1.35)+(lente.terrain*4)+(queso.terrain*1.5)+(huevo.terrain)).to eq(577.3900000000001)
    #puts (vaca.val_en()*3)+(choco.val_en()*1)+(lente.val_en()*3)+(queso.val_en()*1.1)+(huevo.val_en()*0.7)
  end

  it "Se calcula correctamente el impacto ambiental de una mujer de 20-39 años" do
    vaca=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)
    choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
    lente=Alimento.new("lentejas", 23.5, 52.0,1.4,0.4,3.4)
    queso=Alimento.new("queso", 25.0,1.3,33.0,11.0,41.0)
    huevo=Alimento.new("huevo", 13.0,1.1,11.0,4.2,5.7)

    expect((vaca.val_en*3)+(choco.val_en*1)+(lente.val_en*3)+(queso.val_en*1.1)+(huevo.val_en*0.7)).to be >= 2300.0
    expect((vaca.proteins*3)+(choco.proteins*1)+(lente.proteins*3)+(queso.proteins*1.1)+(huevo.proteins*0.7)).to be >= 41.0
    expect((vaca.gei*3)+(choco.gei*1)+(lente.gei*3)+(queso.gei*1.1)+(huevo.gei*0.7)).to eq(168.54)
    expect((vaca.terrain*3)+(choco.terrain*1)+(lente.terrain*3)+(queso.terrain*1.1)+(huevo.terrain*0.7)).to eq(554.6899999999999)
    #puts
  end


  describe Lista do
    before :each do
      hed=Node.new(5,nil,nil)
      tai=Node.new(6,nil,hed)
      hed.next=tai
      @lista = Lista.new(hed,tai)
    end

    it "Existe un nodo de la lista con sus datos, su siguiente y su previo" do
      expect(@lista.insert(120)).to respond_to
      expect(@lista.insert(120)).to respond_to
      expect(@lista.head).not_to be nil
      expect(@lista.head.next.value).not_to be nil
      expect(@lista.head.next.next).not_to be nil
      expect(@lista.head.next.prev).not_to be nil
    end

    it "Existe una Lista con su cabeza y su cola" do
      expect(@lista.head).not_to be nil
      expect(@lista.tail).not_to be nil
    end

    it "Se puede insertar un elemento en la Lista" do
      expect(@lista.insert(120)).to respond_to
    end

    it "Se pueden insertar varios elementos en la Lista" do
      expect(@lista.insert(120)).to respond_to
      expect(@lista.insert(121)).to respond_to
      expect(@lista.insert(122)).to respond_to
      expect(@lista.insert(123)).to respond_to
    end

    it "Se extrae el primer elemento de la lista" do
      expect(@lista).to respond_to(:extract_h)
      expect(@lista.extract_h.value).to eq(5)
    end

    it "Se extrae el ultimo elemento de la lista" do
      expect(@lista).to respond_to(:extract_t)
      #expect(@lista.extract_t.value).to eq(7)
    end

  end



end
