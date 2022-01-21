require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative '../lib/space'
require_relative '../lib/booking'
require_relative '../lib/user'

class MakersBnB < Sinatra::Base
  configure :development, :test do
    set :views, 'views'
    set :public_folder, 'public'
    register Sinatra::Reloader
    register Sinatra::Flash
    also_reload '../lib/booking.rb'
    also_reload '../lib/space.rb'
  end

enable :sessions

get '/' do
  redirect '/listings'
end

post '/create-booking/:space_id' do
  Booking.create(
    check_in_date: params['check_in'],
    check_out_date: params['check_out'],
    space_id: params['space_id'],
    user_id: session[:user_id]
  )
  redirect '/listings'
end

  run! if app_file == $0
end
