class Order

  attr_reader :deliveries

  def initialize
    @deliveries = []
  end

  def add_delivery(delivery)
    @deliveries << delivery
  end

  def remove_delivery(delivery)
    @deliveries.delete(delivery)
  end
  

end
