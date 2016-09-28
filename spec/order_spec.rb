require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:delivery) { double :delivery }

  it 'stores all of the deliveries on the order and is initially empty' do
    expect(order.deliveries).to eq []
  end

  describe '#add_delivery' do
    it 'deliveries can be added to the order' do
      order.add_delivery(delivery)
      expect(order.deliveries).to include delivery
    end
  end

  describe '#remove_delivery' do
    # Do we want to raise an error if someone tries to remove a delivery not currently on the order
    it 'deliveries can be removed from the order' do
      order.add_delivery(delivery)
      order.remove_delivery(delivery)
      expect(order.deliveries).not_to include delivery
    end
  end


end
