require 'booking'
require 'database_helpers'

describe Booking do
  
  let(:check_in_date) { '2022-02-20' }
  let(:check_out_date) { '2022-03-05' }
  let(:space_id) { '101' } 
  let(:booking) { Booking.create(check_in_date: check_in_date, check_out_date: check_out_date, space_id: space_id) }
  let(:bookings_table) { 'bookings' }

  describe '#id' do
    it 'returns the id of the booking' do
      persisted_data = persisted_data(booking.id, bookings_table)
      expect(booking.id).to eq persisted_data[0]['id']
    end
  end

  describe '#check_in_date' do
    it 'returns the check_in date' do
      expect(booking.check_in_date).to eq check_in_date
    end
  end
  describe '#check_out_date' do
    it 'returns the check_out date' do
      expect(booking.check_out_date).to eq check_out_date
    end
  end
  describe '#space_id' do
    it 'returns the space_id' do
      expect(booking.space_id).to eq space_id
    end
  end
  
  describe '.create' do
    it 'makes a booking' do
      #Arrange
      # nothing to arrange
      #Act
      first_booking = Booking.create(
        check_in_date: check_in_date, 
        check_out_date: check_out_date, 
        space_id: space_id
      )
      #Assert
      #I want a booking . create to return me a booking object. With checkin, checkout and spoace ID 

      persisted_data = persisted_data(first_booking.id, bookings_table)

      expect(first_booking).to be_a Booking
      expect(first_booking.id).to eq persisted_data[0]['id']
      expect(first_booking.check_in_date).to eq check_in_date
      expect(first_booking.check_out_date).to eq check_out_date
      expect(first_booking.space_id).to eq space_id
    end
  end

  describe '.all' do
    it 'returns all bookings' do
      # I added two bookings
      Booking.create(
        check_in_date: check_in_date,
        check_out_date: check_out_date,
        space_id: space_id
      )
      Booking.create(
        check_in_date: '2022-12-24',
        check_out_date: '2022-12-28',
        space_id: '5'
      )
      #act
      # call Booking.all

      bookings = Booking.all
      first_booking = bookings[0]
      persisted_data_1 = persisted_data(first_booking.id, 'bookings')

      second_booking = bookings[1]
      persisted_data_2 = persisted_data(second_booking.id, 'bookings')

      
      expect(bookings.length).to eq 2
      # We wanna check if the first booking has all the values
      expect(first_booking).to be_a Booking
      expect(first_booking.id).to eq persisted_data_1[0]['id']
      expect(first_booking.check_in_date).to eq check_in_date
      expect(first_booking.check_out_date).to eq check_out_date
      expect(first_booking.space_id).to eq space_id
  
      # We wanna check if the second booking
      expect(second_booking.id).to eq persisted_data_2[0]['id']
      expect(second_booking.check_in_date).to eq '2022-12-24'
      expect(second_booking.check_out_date).to eq '2022-12-28'
      expect(second_booking.space_id).to eq '5'
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