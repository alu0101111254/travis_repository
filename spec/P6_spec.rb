RSpec.describe P6 do
  describe Alimento do
    before :each do
      @alimento=Alimento.new("Carne de vaca",50.0,164.0)
    end

it "has a version number" do
    expect(P6::VERSION).not_to be nil
  end

  it "Has a name" do
    expect(@alimento).to have_attributes(:name => "Carne de vaca")
  end

  it "Has a GEI" do
    expect(@alimento).to have_attributes(:gei => 50.0)
  end

  it "Has a terrain" do
    expect(@alimento).to have_attributes(:terrain => 164.0)
  end
 end
end
