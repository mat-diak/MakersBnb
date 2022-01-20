require 'pg'

def setup_test_database
  p 'Setting up database...'
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE TABLE bookings;')
end