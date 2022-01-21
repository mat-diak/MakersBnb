require_relative '../database_connection_setup'
require_relative '../lib/space'
require 'date'
require 'pg'

class Booking

  def self.all
    result = database_connection.exec("SELECT * FROM bookings;")
    result.map { |booking_data| 
      Booking.new(
        id: booking_data['id'],
        check_in_date: booking_data['check_in'], 
        check_out_date: booking_data['check_out'], 
        space_id: booking_data['space_id'],
        user_id: booking_data['user_id']
      )
    }
  end
  
  def self.create(check_in_date:, check_out_date:, space_id:, user_id:)
    output = database_connection.exec_params(
      "INSERT INTO bookings (check_in, check_out, space_id, user_id) VALUES ($1, $2, $3, $4)
      RETURNING id, check_in, check_out, space_id, user_id",
      [check_in_date, check_out_date, space_id, user_id]
    )
    Booking.new(
        id: output[0]['id'],
        check_in_date: output[0]['check_in'], 
        check_out_date: output[0]['check_out'], 
        space_id: output[0]['space_id'],
        user_id: output[0]['user_id']
      )
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'makers_bnb_test')
    else
      PG.connect(dbname: 'makers_bnb')
    end
  end

  def self.find_by_user(user_id)
    users_bookings = DatabaseConnection.query("SELECT * FROM bookings WHERE user_id=$1", [user_id])
    users_bookings.map do |booking_data|
      Booking.new(
      id: booking_data['id'],
      check_in_date: booking_data['check_in'], 
      check_out_date: booking_data['check_out'], 
      space_id: booking_data['space_id'],
      user_id: booking_data['user_id']
      )
    end
  end

  attr_reader :id, :check_in_date, :check_out_date, :space_id

  def initialize(id:, check_in_date:, check_out_date:, space_id:, user_id:)
    @id = id
    @check_in_date = check_in_date
    @check_out_date = check_out_date
    @space_id = space_id
    @user_id = user_id
  end

  def calculate_price
    check_in = Date.parse(@check_in_date)
    check_out = Date.parse(@check_out_date)
    (check_in..check_out).to_a.length * Space.find_by_id(@space_id).price_per_day.to_i
  end
end
