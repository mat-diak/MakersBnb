require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/space'

class MakersBnB < Sinatra::Base
  configure :development, :test do
    set :views, 'views'
    set :public_folder, 'public'
    register Sinatra::Reloader
    also_reload '../lib/booking.rb'
    also_reload '../lib/space.rb'
  end

enable :sessions

get '/' do
  'Hello world!'
end

  run! if app_file == $0
end
