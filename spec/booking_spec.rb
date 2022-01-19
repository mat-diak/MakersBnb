require 'booking'

describe Booking do
  
  let(:booking) { Booking.new(check_in_date: '19/01/22', check_out_date: '25/01/22', space_id: 'some_id') }

  describe '#check_in_date' do
    it 'returns the check_in date' do
      expect(booking.check_in_date).to eq '19/01/22'
    end
  end
  describe '#check_out_date' do
    it 'returns the check_out date' do
      expect(booking.check_out_date).to eq '25/01/22'
    end
  end
  describe '#space_id' do
    it 'returns the space_id' do
      expect(booking.space_id).to eq 'some_id'
    end
  end
  
  describe '.create' do
    it 'makes a booking.' do
      #Arrange
      # nothing to arrange
      #Act
      first_booking = Booking.create(check_in_date: '19/01/22', check_out_date: '25/01/22', space_id: 'some_id')
      #Assert
      #I want a booking . create to return me a booking object. With checkin, checkout and spoace ID 
      expect(first_booking).to be_a Booking
      expect(first_booking.check_in_date).to eq '19/01/22'
      expect(first_booking.check_out_date).to eq '25/01/22'
      expect(first_booking.space_id).to eq 'some_id'
      expect(Booking.all).to include first_booking
    end
  end

  describe '.all' do
    it 'returns all bookings.' do
      #arrange
      # I added two bookings.
      first_booking = Booking.create(
        check_in_date: '25/12/22',
        check_out_date: '27/12/22',
        space_id: 'id_1'
      )
      second_booking = Booking.create(
        check_in_date: '12/11/22',
        check_out_date: '14/11/22',
        space_id: 'id_2'
      )
      #act
      # call Booking.all
      #assert
      # I want Booking.all to have all created bookings
      expect(Booking.all.length).to be 2
      expect(Booking.all).to include first_booking, second_booking
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