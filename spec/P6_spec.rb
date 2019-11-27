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
    context "Comparaciones p8" do
      it "funciona el método <=>" do
        cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
        choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)#>
        vaca=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)#=
        expect(@alimento<=>vaca).to eq(0)
        expect(@alimento<=>cafe).to eq(1)
        expect(@alimento<=>choco).to eq(-1)
      end
      context "funcionan los metodos mixins" do
        it "metodo <" do
          cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
          choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)#>
          expect(@alimento<cafe).to eq(false)
          expect(@alimento<choco).to eq(true)
        end
        it "metodo >" do
          cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
          choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)#>
          expect(@alimento>cafe).to eq(true)
          expect(@alimento>choco).to eq(false)
        end

        it "metodo ==" do
          vaca=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)#=
          choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)#>
          expect(@alimento==vaca).to eq(true)
          expect(@alimento==choco).to eq(false)
        end

        it "metodos >= y <=" do
          cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
          choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)#>
          vaca=Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0)#=
          expect(@alimento>=cafe).to eq(true)
          expect(@alimento>=choco).to eq(false)
          expect(@alimento<=cafe).to eq(false)
          expect(@alimento<=choco).to eq(true)
          expect(@alimento<=vaca).to eq(true)
          expect(@alimento>=vaca).to eq(true)
        end

        it "metodo between?" do
          cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
          choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
          expect(@alimento.between?(cafe,choco)).to eq(true)
        end
         it "metodo clamp" do
           cafe=Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)#<
           choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
           expect(@alimento.clamp(choco,choco).val_en).to eq(choco.val_en)
           expect(@alimento.clamp(cafe,choco).val_en).to eq(@alimento.val_en)
         end

      end
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
      tai=Node.new(7,nil,hed)
      hed.next=tai
      @lista = Lista.new(hed,tai)
    end
    context "NODO:" do
      it "Existe un nodo de la lista con sus datos, su siguiente y su previo" do
        expect(@lista.insert(120)).to respond_to
        expect(@lista.insert(120)).to respond_to
        expect(@lista.head).not_to be nil
        expect(@lista.head.next.value).not_to be nil
        expect(@lista.head.next.next).not_to be nil
        expect(@lista.head.next.prev).not_to be nil
      end
    end
    context "LISTA:" do
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
        expect(@lista.extract_t.value).to eq(7)
      end
    end
    context "DIETAS:" do
      it "Se estiman las emisiones diarias de gases de efecto invernadero para cada dieta." do
        espanola=Lista.new(nil,nil)
        algoritmo(20,40,40).each{ |alim| espanola.insert(alim)  }
        gei=0
        while espanola.tail!=nil do
          gei+=espanola.extract_t.value.gei
        end
        #puts gei
        expect(gei).to eq(54.9)

        vasca=Lista.new(nil,nil)
        algoritmo(15,25,40).each{ |alim| vasca.insert(alim)  }
        gei=0
        while vasca.tail!=nil do
          gei+=vasca.extract_t.value.gei
        end
        #puts gei
        expect(gei).to eq(171.22000000000003)

        vegetariana=Lista.new(nil,nil)
        algoritmo_vegetariano(15,25,40).each{ |alim| vegetariana.insert(alim)  }
        gei=0
        while vegetariana.tail!=nil do
          gei+=vegetariana.extract_t.value.gei
        end
        #puts gei
        expect(gei).to eq(85.75999999999996)

        vegetaliana=Lista.new(nil,nil)
        algoritmo_vegetaliano(15,25,40).each{ |alim| vegetaliana.insert(alim)  }
        gei=0
        while vegetaliana.tail!=nil do
          gei+=vegetaliana.extract_t.value.gei
        end
        #puts gei
        expect(gei).to eq(68.96)

        lococarne=Lista.new(nil,nil)
        lococarne.insert(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
        lococarne.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
        lococarne.insert(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
        lococarne.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        lococarne.insert(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))

        while lococarne.tail!=nil do
          gei+=lococarne.extract_t.value.gei
        end
        #puts gei
        expect(gei).to eq(149.15999999999997)
      end

      it "Se estiman las emisiones anuales de gases de efecto invernadero para cada dieta." do
        espanola=Lista.new(nil,nil)
        algoritmo(20,40,40).each{ |alim| espanola.insert(alim)  }
        gei=0
        while espanola.tail!=nil do
          gei+=espanola.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(20038.5)

        vasca=Lista.new(nil,nil)
        algoritmo(15,25,40).each{ |alim| vasca.insert(alim)  }
        gei=0
        while vasca.tail!=nil do
          gei+=vasca.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(62495.30000000001)

        vegetariana=Lista.new(nil,nil)
        algoritmo_vegetariano(15,25,40).each{ |alim| vegetariana.insert(alim)  }
        gei=0
        while vegetariana.tail!=nil do
          gei+=vegetariana.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(31302.399999999987)

        vegetaliana=Lista.new(nil,nil)
        algoritmo_vegetaliano(15,25,40).each{ |alim| vegetaliana.insert(alim)  }
        gei=0
        while vegetaliana.tail!=nil do
          gei+=vegetaliana.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(25170.399999999998)

        lococarne=Lista.new(nil,nil)
        lococarne.insert(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
        lococarne.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
        lococarne.insert(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
        lococarne.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        lococarne.insert(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))

        while lococarne.tail!=nil do
          gei+=lococarne.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(54443.39999999999)
      end

      it "Se estiman el terreno necesarios para sostener cada dieta." do
        espanola=Lista.new(nil,nil)
        algoritmo(20,40,40).each{ |alim| espanola.insert(alim)  }
        terrain=0
        while espanola.tail!=nil do
          terrain+=espanola.extract_t.value.terrain
        end
        #puts terrain
        expect(terrain).to eq(178.7)

        vasca=Lista.new(nil,nil)
        algoritmo(15,25,40).each{ |alim| vasca.insert(alim)  }
        terrain=0
        while vasca.tail!=nil do
          terrain+=vasca.extract_t.value.terrain
        end
        #puts terrain
        expect(terrain).to eq(359.46)

        vegetariana=Lista.new(nil,nil)
        algoritmo_vegetariano(15,25,40).each{ |alim| vegetariana.insert(alim)  }
        terrain=0
        while vegetariana.tail!=nil do
          terrain+=vegetariana.extract_t.value.terrain
        end
        #puts terrain
        expect(terrain).to eq(131.68)

        vegetaliana=Lista.new(nil,nil)
        algoritmo_vegetaliano(15,25,40).each{ |alim| vegetaliana.insert(alim)  }
        terrain=0
        while vegetaliana.tail!=nil do
          terrain+=vegetaliana.extract_t.value.terrain
        end
        #puts terrain
        expect(terrain).to eq(78.37999999999992)

        lococarne=Lista.new(nil,nil)
        lococarne.insert(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
        lococarne.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
        lococarne.insert(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
        lococarne.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        lococarne.insert(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))

        while lococarne.tail!=nil do
          terrain+=lococarne.extract_t.value.terrain
        end
        #puts terrain
        expect(terrain).to eq(449.67999999999995)
      end
    end

    context "Operaciones enumerate" do
      it "funciona el metodo each" do
        sum=0

        @lista.each do |cosa|
          sum+=cosa
        end
        expect(sum).to eq(5+7)
      end

      it "funciona el mixin max" do
        @lista.insert(10)
        expect(@lista.max).to eq(10)
      end

      it "funciona el mixin min" do
        @lista.insert(1)
        expect(@lista.min).to eq(1)
      end

      it "funciona el mixin collect" do
        @lista.insert(9)
        expect(@lista.collect{|x| x*10}).to eq([50,70,90])
      end

      it "funciona el mixin select" do
        @lista.insert(8)
        expect(@lista.select{|x| x==5 || x.even? }).to eq([1,8])
      end

      it "funciona el mixin sort" do
        @lista.insert(9)
        expect(@lista.collect{|x| x*10}).to eq([9,7,5])
      end

    end
  end



end
