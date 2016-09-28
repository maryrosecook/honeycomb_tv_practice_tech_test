require 'delivery'

describe Delivery do
  let(:delivery) { described_class.new(:standard, :ITV) }

  it 'is initialized with a type' do
    expect(delivery.type).to eq :standard
  end

  it 'is initialized with a broadcaster' do
    expect(delivery.broadcaster).to eq :ITV
  end
end
