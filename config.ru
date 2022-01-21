require_relative './controllers/app_controller'
require_relative './controllers/user_controller'
require_relative './controllers/listing_controller'

use UserController
use ListingController
run MakersBnB