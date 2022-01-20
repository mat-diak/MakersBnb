require 'pg'

class Booking

  def self.all
    result = database_connection.exec("SELECT * FROM bookings;")
    result.map { |booking_data| 
      Booking.new(
        id: booking_data['id'],
        check_in_date: booking_data['check_in'], 
        check_out_date: booking_data['check_out'], 
        space_id: booking_data['space_id']
      )
    }
  end
  
  def self.create(check_in_date:, check_out_date:, space_id:)
    output = database_connection.exec_params(
      "INSERT INTO bookings (check_in, check_out, space_id) VALUES ($1, $2, $3)
      RETURNING id, check_in, check_out, space_id",
      [check_in_date, check_out_date, space_id]
    )
    Booking.new(
        id: output[0]['id'],
        check_in_date: output[0]['check_in'], 
        check_out_date: output[0]['check_out'], 
        space_id: output[0]['space_id']
      )
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'makers_bnb_test')
    else
      PG.connect(dbname: 'makers_bnb')
    end
  end

  attr_reader :id, :check_in_date, :check_out_date, :space_id

  def initialize(id:, check_in_date:, check_out_date:, space_id:)
    @id = id
    @check_in_date = check_in_date
    @check_out_date = check_out_date
    @space_id = space_id
  end
end
