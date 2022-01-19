# We wanna create a booking class here!

class Booking
  
  @bookings = []

  def self.all
    @bookings
  end
  
  def self.create(check_in_date:, check_out_date:, space_id:)
    Booking.new(
      check_in_date: check_in_date, 
      check_out_date: check_out_date, 
      space_id: space_id
    )
  end

  attr_reader :check_in_date, :check_out_date, :space_id

  def initialize(check_in_date:, check_out_date:, space_id:)
    @check_in_date = check_in_date
    @check_out_date = check_out_date
    @space_id = space_id
  end
end