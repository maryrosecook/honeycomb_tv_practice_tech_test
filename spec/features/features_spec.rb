describe 'Features' do
  it 'correctly calculates the total delivery cost for first given example' do
    order = Order.new
    order.add_delivery(Delivery.new(:standard, :Disney, AdvertisingMaterial.new("WNP/SWCL001/010")))
    order.add_delivery(Delivery.new(:standard, :Discovery, AdvertisingMaterial.new("WNP/SWCL001/010")))
    order.add_delivery(Delivery.new(:standard, :Viacom, AdvertisingMaterial.new("WNP/SWCL001/010")))
    order.add_delivery(Delivery.new(:express, :Horse_and_Country, AdvertisingMaterial.new("WNP/SWCL001/010")))
    expect(order.total_cost).to eq 45
  end

  it 'correctly calculates the total delivery cost for the second given example' do
    order = Order.new
    order.add_delivery(Delivery.new(:express, :Disney, AdvertisingMaterial.new("ZDW/EOWW005/010")))
    order.add_delivery(Delivery.new(:express, :Discover, AdvertisingMaterial.new("ZDW/EOWW005/010")))
    order.add_delivery(Delivery.new(:express, :Viacom, AdvertisingMaterial.new("ZDW/EOWW005/010")))
    expect(order.total_cost).to eq 40.5
  end
end
