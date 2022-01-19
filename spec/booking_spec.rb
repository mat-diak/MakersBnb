describe Booking do
  describe '.create' do
    it 'makes a booking.' do



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