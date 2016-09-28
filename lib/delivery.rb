class Delivery

  # Do we need these??
  attr_reader :type, :broadcaster, :advertising_material

  def initialize(type, broadcaster, advertising_material)
    @type = type
    @broadcaster = broadcaster
    @advertising_material = advertising_material
  end

end
