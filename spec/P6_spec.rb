RSpec.describe P6 do
  describe Alimento do
    before :each do
      @alimento=Alimento.new("Carne de vaca",50.0,164.0)
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
    expect(@alimento.name).to eq("Carne de vaca")
  end

  it "Existe metodo que devuelve el gei" do
    expect(@alimento.gei).to eq(50.0)
  end


 end
end
