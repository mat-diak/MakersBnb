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

get '/listings' do
  @spaces = Space.all
  erb(:'index')
end

get '/create-listing' do
  erb(:'create_listing')
end


post '/selected_listings' do
  filtered_spaces = Space.filter(date_from: params['requested_from'], date_to: params['requested_until'])
  session[:filtered_spaces] = filtered_spaces
  redirect '/selected_listings'
end

get '/selected_listings' do
  @spaces = session[:filtered_spaces]
  erb :selected_listings
end

# We wanna have a filtered view

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
