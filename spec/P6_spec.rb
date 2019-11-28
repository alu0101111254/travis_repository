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
        #puts espanola.to_s
        while espanola.tail!=nil do
          gei+=espanola.extract_t.value.gei
        end
        #puts gei
        expect(gei*365).to eq(20038.5)

        vasca=Lista.new(nil,nil)
        algoritmo(15,25,40).each{ |alim| vasca.insert(alim)  }
        gei=0
        #puts vasca.to_s
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
        expect(@lista.select{|x| x==5 || x.even? }).to eq([5,8])
      end

      it "funciona el mixin sort" do
        @lista.insert(9)
        expect(@lista.sort).to eq([5,7,9])
      end

    end
  end

  describe BasicPlato do
    before :each do
        @lista=Lista.new(nil,nil)
        @lista.insert(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
        @lista.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
        @lista.insert(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
        @lista2=Lista.new(nil,nil)
        @lista2.insert(100.0)
        @lista2.insert(100.0)
        @lista2.insert(100.0)
        @pl1=BasicPlato.new("Fiesta Carne",@lista,@lista2)
    end

    it "Obteniendo el nombre de un plato" do
      expect(@pl1.name).to eq("Fiesta Carne")
    end
    it "Existe un conjunto de alimentos" do
      expect(@pl1.list).not_to be nil
      expect(@pl1.list).to eq(@lista)
    end

    it "Existe un conjunto de cantidades de alimentos en gramos." do
      expect(@pl1.grams).not_to be nil
      expect(@pl1.grams).to eq(@lista2)
    end

    it "Porcentaje de proteínas del conjunto de alimentos." do
      expect(@pl1.prot).to eq(69.65517241379311)
    end

    it "Porcentaje de lípidos del conjunto de alimentos." do
      expect(@pl1.lipid).to eq(30.344827586206897)
    end

    it "Porcentaje de hidrados de carbono del conjunto de alimentos." do
      expect(@pl1.carbs).to eq(0.0)
    end

    it "Valor Calórico Total (V.C.T) del conjunto de alimentos expresado en kilocalorías." do
      expect(@pl1.vct).to eq(((21.1+18.0+21.5)*4)+((3.1+17.0+6.3)*9))
    end

    it "Se obtiene el plato formateado." do
      expect(@pl1.to_s).to respond_to
    end



  end
  describe Plato do
    before :each do
      @lista=Lista.new(nil,nil)
      @lista.insert(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
      @lista.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
      @lista.insert(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
      @lista2=Lista.new(nil,nil)
      @lista2.insert(100.0)
      @lista2.insert(100.0)
      @lista2.insert(100.0)
      @pl2=Plato.new("Fiesta Carne",@lista,@lista2)

      @lista3=Lista.new(nil,nil)
      @lista3.insert(Alimento.new("Cafe", 0.3, 0.0, 0.0, 0.12, 0.9))
      @lista4=Lista.new(nil,nil)
      @lista4.insert(300.0)
      @pl3=Plato.new("sobredosis de cafe",@lista3,@lista4)

      @lista5=Lista.new(nil,nil)
      @lista5.insert(Alimento.new("Chocolate", 15.9, 47.0*3, 90.0, 2.3*3, 3.4*3))
      @lista6=Lista.new(nil,nil)
      @lista6.insert(100.0)
      @pl4=Plato.new("Fuente de chocolate",@lista5,@lista6)
    end

    it "Valor total de la emisiones diarias de de gases de efecto invernadero." do
      expect(@pl2.gei_diario).to eq(50+20+7.6)
    end

    it "Estimación de los metros cuadrados de uso de terreno." do
      expect(@pl2.terrain).to eq(164.0+185.0+11.0)
    end

    it "Se obtiene la eficiencia energética formateada." do
      expect(@pl2.to_s).to respond_to
    end

    it "comprobar la clase" do
      expect(@pl2).is_a?(Plato)
    end

    it "comprobar el tipo de objeto" do
      expect(@pl2).kind_of?(BasicPlato)
    end

    it "comprobar la jerarquia de clases " do
      expect(Plato.ancestors.include? BasicPlato).to eq(true)
      expect(Plato.ancestors.include? Alimento).to eq(false)
    end

    context "Comparable" do

      it "funciona el método <=>" do
        expect(@pl2<=>@pl2).to eq(0)
        expect(@pl2<=>@pl3).to eq(1)
        expect(@pl3<=>@pl2).to eq(-1)
      end

      it "metodo <" do
        expect(@pl2<@pl3).to eq(false)
        expect(@pl3<@pl2).to eq(true)
      end
      it "metodo >" do
        expect(@pl2>@pl3).to eq(true)
        expect(@pl3>@pl2).to eq(false)
      end

      it "metodo ==" do
        expect(@pl2==@pl2).to eq(true)
        expect(@pl3==@pl2).to eq(false)
      end

      it "metodos >= y <=" do
        expect(@pl2<=@pl3).to eq(false)
        expect(@pl3<=@pl2).to eq(true)
        expect(@pl2>=@pl3).to eq(true)
        expect(@pl3>=@pl2).to eq(false)
        expect(@pl2<=@pl2).to eq(true)
        expect(@pl2>=@pl2).to eq(true)
      end

      it "metodo between?" do
        expect(@pl2.between?(@pl3,@pl4)).to eq(true)
        expect(@pl2.between?(@pl2,@pl3)).to eq(false)
      end
      it "metodo clamp" do
        expect(@pl4.clamp(@pl3,@pl2)).to eq(@pl2)
      end
      context "Comparacion y enumeracion de los platos de cada dieta" do
        before :each do

          #espanola 20p40c40g

          @ingredientesE1=Lista.new(nil,nil)
          @ingredientesE1.insert(Alimento.new("Café", 0.05, 0.0, 0.0, 0.2, 0.15))
          @ingredientesE1.insert(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
          @proporcionesE1=Lista.new(nil,nil)
          @proporcionesE1.insert(50.0)
          @proporcionesE1.insert(50.0)
          @platoE1=Plato.new("Cortado",@ingredientesE1,@proporcionesE1)

          @ingredientesE2=Lista.new(nil,nil)
          @ingredientesE2.insert(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0, 328.0))
          @ingredientesE2.insert(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
          @proporcionesE2=Lista.new(nil,nil)
          @proporcionesE2.insert(200.0)
          @proporcionesE2.insert(50.0)
          @platoE2=Plato.new("Filete de ternera con salsa de frutos secos",@ingredientesE2,@proporcionesE2)

          @ingredientesE3=Lista.new(nil,nil)
          @ingredientesE3.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
          @ingredientesE3.insert(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
          @proporcionesE3=Lista.new(nil,nil)
          @proporcionesE3.insert(200.0)
          @proporcionesE3.insert(50.0)
          @platoE3=Plato.new("Brownie con nueces",@ingredientesE3,@proporcionesE3)

          @espanola= Lista.new(nil,nil)
          @espanola.insert(@platoE1)
          @espanola.insert(@platoE2)
          @espanola.insert(@platoE3)

          #@vasca#15p60c25g
          @ingredientesV1=Lista.new(nil,nil)
          @ingredientesV1.insert(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))#huevos
          @ingredientesV1.insert(Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
          @proporcionesV1=Lista.new(nil,nil)
          @proporcionesV1.insert(100.0)
          @proporcionesV1.insert(100.0)
          @platoV1=Plato.new("Cortado largo",@ingredientesV1,@proporcionesV1)

          @ingredientesV2=Lista.new(nil,nil)
          @ingredientesV2.insert(Alimento.new("Cerveza", 1.0, 7.2, 0.0, 0.48, 0.44))
          @ingredientesV2.insert(Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
          @proporcionesV2=Lista.new(nil,nil)
          @proporcionesV2.insert(200.0)
          @proporcionesV2.insert(100.0)
          @platoV2=Plato.new("Filete de ternera con salsa de frutos secos",@ingredientesV2,@proporcionesV2)

          @ingredientesV3=Lista.new(nil,nil)
          @ingredientesV3.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
          @proporcionesV3=Lista.new(nil,nil)
          @proporcionesV3.insert(200.0)
          @platoV3=Plato.new("Tarta de chocolate",@ingredientesV3,@proporcionesV3)

          @vasca= Lista.new(nil,nil)
          @vasca.insert(@platoV1)
          @vasca.insert(@platoV2)
          @vasca.insert(@platoV3)


          #vegetariana#española 85%carne=leche 15%=huevos

          @ingredientesVR1=Lista.new(nil,nil)
          @ingredientesVR1.insert(Alimento.new("Café", 0.05, 0.0, 0.0, 0.2, 0.15))
          @ingredientesVR1.insert(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
          @proporcionesVR1=Lista.new(nil,nil)
          @proporcionesVR1.insert(50.0)
          @proporcionesVR1.insert(50.0)
          @platoVR1=Plato.new("Cafe frutoso",@ingredientesVR1,@proporcionesVR1)

          @ingredientesVR2=Lista.new(nil,nil)
          @ingredientesVR2.insert(Alimento.new("Leche de vaca", 3.3*1.7, 4.8*1.7, 3.2*1.7, 3.2*1.7, 8.9*1.7))
          @ingredientesVR2.insert(Alimento.new("Huevos", 13.0*0.3, 1.1*0.3, 11.0*0.3, 4.2*0.3, 5.7*0.3))
          @ingredientesVR2.insert(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
          @proporcionesVR2=Lista.new(nil,nil)
          @proporcionesVR2.insert(170.0)
          @proporcionesVR2.insert(30.0)
          @proporcionesVR2.insert(50.0)
          @platoVR2=Plato.new("Medley vegetariano",@ingredientesVR2,@proporcionesVR2)

          @ingredientesVR3=Lista.new(nil,nil)
          @ingredientesVR3.insert(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
          @ingredientesVR3.insert(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
          @proporcionesVR3=Lista.new(nil,nil)
          @proporcionesVR3.insert(200.0)
          @proporcionesVR3.insert(50.0)
          @platoVR3=Plato.new("Brownie con nueces",@ingredientesVR3,@proporcionesVR3)

          @vegetariana= Lista.new(nil,nil)
          @vegetariana.insert(@platoVR1)
          @vegetariana.insert(@platoVR2)
          @vegetariana.insert(@platoVR3)



          #vegetaliana#50c 50g
          @ingredientesVL1=Lista.new(nil,nil)
          @ingredientesVL1.insert(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
          @ingredientesVL1.insert(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
          @proporcionesVL1=Lista.new(nil,nil)
          @proporcionesVL1.insert(100.0)
          @proporcionesVL1.insert(100.0)
          @platoVL1=Plato.new("Cafe frutoso largo",@ingredientesVL1,@proporcionesVL1)

          @ingredientesVL2=Lista.new(nil,nil)
          @ingredientesVL2.insert(Alimento.new("Lentejas", 23.5*1.5, 52.0*1.5, 1.4*1.5, 0.4*1.5, 3.4*1.5))
          @ingredientesVL2.insert(Alimento.new("Cerveza", 1.0, 7.2, 0.0, 0.48, 0.44))
          @ingredientesVL2.insert(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
          @proporcionesVL2=Lista.new(nil,nil)
          @proporcionesVL2.insert(150.0)
          @proporcionesVL2.insert(200.0)
          @proporcionesVL2.insert(100.0)
          @platoVL2=Plato.new("Lentejas con tofu",@ingredientesVL2,@proporcionesVL2)

          @ingredientesVL3=Lista.new(nil,nil)
          @ingredientesVL3.insert(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
          @proporcionesVL3=Lista.new(nil,nil)
          @proporcionesVL3.insert(300.0)
          @platoVL3=Plato.new("Sopa de tofu",@ingredientesVL3,@proporcionesVL3)

          @vegetaliana= Lista.new(nil,nil)
          @vegetaliana.insert(@platoVL1)
          @vegetaliana.insert(@platoVL2)
          @vegetaliana.insert(@platoVL3)



          #Carnivora:50% carne
          @ingredientesC1=Lista.new(nil,nil)
          @ingredientesC1.insert(Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7))
          @ingredientesC1.insert(Alimento.new("Cerdo", 21.5*1.5, 0.0, 6.3*1.5, 7.6*1.5, 11.0*1.5))
          @proporcionesC1=Lista.new(nil,nil)
          @proporcionesC1.insert(100.0)
          @proporcionesC1.insert(150.0)
          @platoC1=Plato.new("Desayuno americano",@ingredientesC1,@proporcionesC1)

          @ingredientesC2=Lista.new(nil,nil)
          @ingredientesC2.insert(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
          @ingredientesC2.insert(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
          @ingredientesC2.insert(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0, 328.0))
          @proporcionesC2=Lista.new(nil,nil)
          @proporcionesC2.insert(100.0)
          @proporcionesC2.insert(50.0)
          @proporcionesC2.insert(200.0)
          @platoC2=Plato.new("Steak + café con leche",@ingredientesC2,@proporcionesC2)

          @ingredientesC3=Lista.new(nil,nil)
          @ingredientesC3.insert(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
          @ingredientesC3.insert(Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
          @proporcionesC3=Lista.new(nil,nil)
          @proporcionesC3.insert(100.0)
          @proporcionesC3.insert(100.0)
          @platoC3=Plato.new("Lentejas compuestas",@ingredientesC3,@proporcionesC3)

          @carnivora= Lista.new(nil,nil)
          @carnivora.insert(@platoC1)
          @carnivora.insert(@platoC2)
          @carnivora.insert(@platoC3)

        end
        context "comparacion" do


        end
        context "enumeracion" do
          it "collect" do

          end

          it "select" do
            expect(@espanola.select{|x| x >= @platoE2 }).to eq([@platoE2,@platoE3])
            expect(@vasca.select{|x| x >= @platoV2 }).to eq([@platoV2,@platoV3])
            expect(@vegetariana.select{|x| x >= @platoVR2 }).to eq([@platoVR2,@platoVR3])
            expect(@vegetaliana.select{|x| x >= @platoVL2 }).to eq([@platoVL1,@platoVL2])
            expect(@carnivora.select{|x| x >= @platoC3 }).to eq([@platoC3])

            expect(@espanola.select{|x| x < @platoE2 }).to eq([@platoE1])
            expect(@vasca.select{|x| x < @platoV2 }).to eq([@platoV1])
            expect(@vegetariana.select{|x| x < @platoVR2 }).to eq([@platoVR1])
            expect(@vegetaliana.select{|x| x < @platoVL2 }).to eq([@platoVL3])
            expect(@carnivora.select{|x| x < @platoC3 }).to eq([@platoC1,@platoC2])
          end

          it "max" do
            expect(@espanola.max).to eq(@platoE3)
            expect(@vasca.max).to eq(@platoV3)
            expect(@vegetariana.max).to eq(@platoVR3)
            expect(@vegetaliana.max).to eq(@platoVL1)
            expect(@carnivora.max).to eq(@platoC3)
          end

          it "min" do
            expect(@espanola.min).to eq(@platoE1)
            expect(@vasca.min).to eq(@platoV1)
            expect(@vegetariana.min).to eq(@platoVR1)
            expect(@vegetaliana.min).to eq(@platoVL3)
            expect(@carnivora.min).to eq(@platoC2)
          end

          it "sort" do
            expect(@espanola.sort).to eq([@platoE1,@platoE2,@platoE3])
            expect(@vasca.sort).to eq([@platoV1,@platoV2,@platoV3])
            expect(@vegetariana.sort).to eq([@platoVR1,@platoVR2,@platoVR3])
            expect(@vegetaliana.sort).to eq([@platoVL3,@platoVL2,@platoVL1])
            expect(@carnivora.sort).to eq([@platoC2,@platoC1,@platoC3])
          end


        end
      end
    end
  end




end
