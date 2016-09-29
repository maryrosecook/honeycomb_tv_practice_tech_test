require 'delivery'

describe Delivery do
  let(:delivery) { described_class.new(:standard, :ITV, advertising_material) }

  # is there a reason you didn't mock AdvertisingMaterial? Using real
  # classes means that when that class is broken, the tests for
  # classes that use that class may also fail which makes it harder to
  # track down the source of problems
  let(:advertising_material) { AdvertisingMaterial.new("WNP/SWCL001/010") }

  # maybe group these tests into a describe block?

  it 'is initialized with a type' do
    expect(delivery.type).to eq :standard
  end

  it 'is initialized with a broadcaster' do
    expect(delivery.broadcaster).to eq :ITV
  end

  it 'is initialized with advertising_material' do
    expect(delivery.advertising_material.clock_number).to eq "WNP/SWCL001/010"
  end

  # watch out for random blank lines - nicely formatted code makes a
  # really good impression
end
