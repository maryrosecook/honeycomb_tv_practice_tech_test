require 'order'

describe Order do

  # can some of these lets be moved to be in a lower scope?  eg move
  # standard_delivery and express_delivery to the #total_cost describe
  # block?  good to have vars close to where they are used
  let(:order) { described_class.new }
  let(:delivery) { double :delivery }
  let(:standard_delivery) { Delivery.new(:standard, :ITV, advertising_material) }
  let(:express_delivery) { Delivery.new(:express, :ITV, advertising_material) }
  let(:advertising_material) { AdvertisingMaterial.new("WNP/SWCL001/010") }

  # seems from the description like this test is testing two things
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

    # 300? Is this a typo for 30?
    it 'calculates the total cost when there are discounts on express deliveries and because the total cost is over 300' do

      # great that you're testing the case where both discounts apply
      order.add_delivery(express_delivery)
      order.add_delivery(express_delivery)
      order.add_delivery(standard_delivery)

      # watch out for using constants from your application code in
      # your tests I once saw this bring down online orders for 12
      # hours at an online shop I worked at.  My friend had a constant
      # something like CAN_PROCESS_ORDERS which was on in production
      # and off in development. He had a test that checked it was true
      # in production and false in development. unfortunately, his
      # test checked the value of CAN_PROCESS_ORDERS was equal to the
      # value of of a constant called ORDER_PROCESSING_IS_ON which he
      # accidentally changed to false and then committed.  this meant
      # the test passed, even though order processing was off in
      # production.  to avoid this problem, I always put real values
      # (not references to constants) in my tests.  This means that if
      # the contstants change, you have to update the tests, but
      # that's ok and good.
      expect(order.total_cost). to eq (2 * Order::DISCOUNTED_EXPRESS_DELIVERY_COST + Order::STANDARD_DELIVERY_COST) * 0.9
    end

  end


end
