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
end
