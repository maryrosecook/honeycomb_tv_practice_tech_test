class Order

  STANDARD_DELIVERY_COST = 10
  EXPRESS_DELIVERY_COST = 20
  DISCOUNTED_EXPRESS_DELIVERY_COST = 15

  attr_reader :deliveries

  def initialize
    @deliveries = []
  end

  def add_delivery(delivery)
    @deliveries << delivery
  end

  def remove_delivery(delivery)
    raise "Cannot remove delivery. Delivery not on order" unless @deliveries.include?(delivery)
    @deliveries.delete(delivery)
  end

  def total_cost
    provisional_total_cost > 30 ? provisional_total_cost * 0.9 : provisional_total_cost
  end

  private

  def number_of_standard_deliveries
    @deliveries.select { |delivery| delivery.type == :standard }.count
  end

  def number_of_express_deliveries
    @deliveries.select { |delivery| delivery.type == :express }.count
  end

  def provisional_total_cost
    if number_of_express_deliveries < 2
      (number_of_express_deliveries * EXPRESS_DELIVERY_COST) + (number_of_standard_deliveries * STANDARD_DELIVERY_COST)
    else
      (number_of_express_deliveries * DISCOUNTED_EXPRESS_DELIVERY_COST) + (number_of_standard_deliveries * STANDARD_DELIVERY_COST)
    end
  end

end
