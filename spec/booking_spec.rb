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
    it 'makes a booking' do
      #Arrange
      # nothing to arrange
      #Act
      first_booking = Booking.create(check_in_date: '2022-01-19', check_out_date: '2022-01-22', space_id: '1')
      #Assert
      #I want a booking . create to return me a booking object. With checkin, checkout and spoace ID 
      expect(first_booking).to be_a Booking
      expect(first_booking.check_in_date).to eq '2022-01-19'
      expect(first_booking.check_out_date).to eq '2022-01-22'
      expect(first_booking.space_id).to eq '1'
      expect(Booking.all).to include first_booking
      Booking.empty
    end
  end

  describe '.all' do
    it 'returns all bookings.' do
      # I added two bookings.
      first_booking = Booking.create(
        check_in_date: '2022-01-19',
        check_out_date: '2022-01-22',
        space_id: '1'
      )
      second_booking = Booking.create(
        check_in_date: '2022-02-25',
        check_out_date: '2022-02-30',
        space_id: '2'
      )
      #act
      # call Booking.all
      #assert
      # I want Booking.all to have all created bookings
      expect(Booking.all.length).to eq 2
      expect(Booking.all).to include first_booking, second_booking
    end
  end

end


#   As a guest
# In order to have the best holiday
# I want to request to book a space.

# Plan of action:

#  When we make a booking we want it to add to a database table Bookings
#  we want a unique space id for each space
#  we want columns- (id SERIAL PRIMARY KEY, check_in_date DATE, check_out_date DATE, space_id INTEGER)
#  connect database to making a booking