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
    # try to avoid using magic numbers.  You've got the right approach
    # with the constants at the top
    provisional_total_cost > 30 ? provisional_total_cost * 0.9 : provisional_total_cost
  end

  private

  def number_of_standard_deliveries
    # really nice!
    @deliveries.select { |delivery| delivery.type == :standard }.count
  end

  def number_of_express_deliveries
    @deliveries.select { |delivery| delivery.type == :express }.count
  end

  # this method name could be more descriptive. It doesn't really describe why the cost is provisional. could you structure this code so that each discount has an associated method and these methods are applied to a total in sequence? The spec mentioned flexibility.  (But it's really good that you didn't try and prematurely abstract this code - leaving it as methods that cooperate is flexible and non-committal which is good.)
  def provisional_total_cost
    # feels like the bodies of this conditional could be dried up
    if number_of_express_deliveries < 2 # could this be a method?
      (number_of_express_deliveries * EXPRESS_DELIVERY_COST) + (number_of_standard_deliveries * STANDARD_DELIVERY_COST)
    else
      (number_of_express_deliveries * DISCOUNTED_EXPRESS_DELIVERY_COST) + (number_of_standard_deliveries * STANDARD_DELIVERY_COST)
    end
  end

end
