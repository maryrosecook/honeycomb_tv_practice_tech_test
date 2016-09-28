require 'advertising_material'

describe AdvertisingMaterial do
  let(:advertising_material) { described_class.new("WNP/SWCL001/010") }

  it 'has a unique clock number' do
    expect(advertising_material).to respond_to(:clock_number)
  end
end
