require 'sinatra'

require_relative './controllers/booking_controller'
require_relative './controllers/user_controller'
require_relative './controllers/listing_controller'
require_relative './controllers/app_controller'


use ListingController
use UserController
use BookingController
run MakersBnB