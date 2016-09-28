require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:delivery) { double :delivery }
  let(:standard_delivery) { Delivery.new(:standard, :ITV, advertising_material) }
  let(:express_delivery) { Delivery.new(:express, :ITV, advertising_material) }
  let(:advertising_material) { AdvertisingMaterial.new("WNP/SWCL001/010") }

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
    it 'deliveries can be removed from the order' do
      order.add_delivery(delivery)
      order.remove_delivery(delivery)
      expect(order.deliveries).not_to include delivery
    end

    it 'raises an error if delivery is not on the order' do
      expect { order.remove_delivery(delivery) }.to raise_error "Cannot remove delivery. Delivery not on order"
    end

  end

  describe '#total_cost' do
    it 'calculates the total cost of an order containing two standard deliveries (no discount)' do
      order.add_delivery(standard_delivery)
      order.add_delivery(standard_delivery)
      expect(order.total_cost).to eq (2 * Order::STANDARD_DELIVERY_COST)
    end

    it 'calculates the total cost of an order containing one standard delivery, one express (no discount)' do
      order.add_delivery(standard_delivery)
      order.add_delivery(express_delivery)
      expect(order.total_cost).to eq (Order::STANDARD_DELIVERY_COST + Order::EXPRESS_DELIVERY_COST)
    end

    it 'calculates the total cost of an order containing two express deliveries (with discount)' do
      order.add_delivery(express_delivery)
      order.add_delivery(express_delivery)
      expect(order.total_cost). to eq (2 * Order::DISCOUNTED_EXPRESS_DELIVERY_COST)
    end

    it 'calculates the total cost when there are discounts on express deliveries and because the total cost is over 300' do
      order.add_delivery(express_delivery)
      order.add_delivery(express_delivery)
      order.add_delivery(standard_delivery)
      expect(order.total_cost). to eq (2 * Order::DISCOUNTED_EXPRESS_DELIVERY_COST + Order::STANDARD_DELIVERY_COST) * 0.9
    end

  end


end
