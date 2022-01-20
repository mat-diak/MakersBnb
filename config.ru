require_relative './controllers/app_controller'
require_relative './controllers/booking_controller'
require_relative './controllers/user_controller'


use UserController
use BookingController
run MakersBnB