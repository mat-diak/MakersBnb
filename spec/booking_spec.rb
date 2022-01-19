describe Booking do

  describe '.create' do
    it 'makes a booking.' do
      first_booking = Booking.create(check_in_date: '19/01/21', check_out_date:, space_id:)
      #I want a booking . create to return me a booking object. With checkin, checkout and spoace ID 
      expect(first_booking).to be_a Booking
      expect(first_booking).to check_in_date:, check_out_date:, space_id:]
      expect(first_booking[check_in_date]) to eq '19/01/21'
    end
  end

  describe '.all' do
    it 'returns all bookings.' do
      #arrange
      Booking.new(check_in_date: '19/01/21', check_out_date
      Booking.new(check_in_date)
      #assert
      expect(Booking).to eq
      
    end
  end

end


#   As a guest
# In order to have the best holiday
# I want to request to book a space.

# Plan of action:

#  We want to be able to book a space
#  we want to take check_in and check-out dates
#  we may add name (later user_id)
#  When we make a booking we want it to add to a database table Bookings
#  we want a unique space id for each space
#  we want columns- (id SERIAL PRIMARY KEY, check_in_date DATE, check_out_date DATE, space_id INTEGER)
#  connect database to making a booking