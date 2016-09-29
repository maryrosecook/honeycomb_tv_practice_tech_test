class Delivery

  # Do we need these??
  # good question - decide on this and remove the comment before
  # submitting the tech test to a companny
  attr_reader :type, :broadcaster, :advertising_material

  def initialize(type, broadcaster, advertising_material)
    @type = type
    @broadcaster = broadcaster
    @advertising_material = advertising_material
  end

end
