class Delivery

  attr_reader :type, :broadcaster

  def initialize(type, broadcaster)
    @type = type
    @broadcaster = broadcaster
  end

  # Or should, instead I have @standard = true, @express = false, etc?

end
