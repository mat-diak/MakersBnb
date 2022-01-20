require_relative './controllers/app'
require_relative './controllers/booking'
require_relative './controllers/user'


use User
use Booking
run MakersBnB