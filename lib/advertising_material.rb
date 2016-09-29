# this class doesn't have any behaviour, so it may be premature to
# have it modelled as a class.  perhaps an open struct or just a
# string? Sandi Metz has some good stuff about this in her book
# practical object oriented design in ruby

class AdvertisingMaterial

  attr_reader :clock_number

  def initialize(clock_number)
    @clock_number = clock_number
  end

end
