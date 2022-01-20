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

get '/' do
  'Hello world!'
end

get '/new' do
  erb(:'new_space')
end

get '/listings' do
  requested_from = params['requested_from']
  requested_until = params['requested_until']

  if requested_from == nil || requested_until == nil
    @spaces = Space.all
  else
    @spaces = Space.filter(date_to: requested_until, date_from: requested_from)
  end
  erb(:'index')
end

post '/listing' do
 
  Space.create(
    name: params[:name], 
    description: params[:description], 
    price_per_day: params[:price_per_day],
    available_from: params[:available_from],
    available_to: params[:available_to]
    )
  redirect '/listings'
end

  run! if app_file == $0
end
