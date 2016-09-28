require 'delivery'

describe Delivery do
  let(:delivery) { described_class.new(:standard, :ITV, advertising_material) }
  let(:advertising_material) { AdvertisingMaterial.new("WNP/SWCL001/010") }

  it 'is initialized with a type' do
    expect(delivery.type).to eq :standard
  end

  it 'is initialized with a broadcaster' do
    expect(delivery.broadcaster).to eq :ITV
  end

  it 'is initialized with advertising_material' do
    expect(delivery.advertising_material.clock_number).to eq "WNP/SWCL001/010"
  end

end
