require 'pg'
# We wanna create a booking class here!

class Booking
  
  @bookings = []

  def self.all
    @bookings
  end
  
  def self.create(check_in_date:, check_out_date:, space_id:)
    @bookings << Booking.new(
      check_in_date: check_in_date, 
      check_out_date: check_out_date, 
      space_id: space_id
    )
    @bookings[-1] 
  end

  attr_reader :check_in_date, :check_out_date, :space_id

  def initialize(check_in_date:, check_out_date:, space_id:)
    @check_in_date = check_in_date
    @check_out_date = check_out_date
    @space_id = space_id
  end

  # This is a temporary fix until we connect the database. 
  def self.empty
    @bookings = []
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'makers_bnb_test')
    else
      PG.connect(dbname: 'makers_bnb')
    end
  end
end





