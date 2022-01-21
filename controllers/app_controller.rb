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

get '/user/:id' do
  if @user = User.find_by_id(session[:user_id]) 
    @bookings = Booking.find_by_user(@user.id)
    erb :user_interface
  else
    redirect 'listings' 
  end
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.register(
    name: params['name'],
    username: params['username'],
    email: params['email'],
    password: params['password'],
  )
  session[:user_id] = user.id
  redirect '/listings'
end

get '/login' do
  erb :login
end

post '/login' do
  if User.sign_in(params['username'], params['password'])
    session[:user_id] = User.sign_in(params['username'], params['password']).id
    redirect '/listings'
  else
    flash[:notice_wrong_details] = 'Incorrect details!'
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
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

get '/listing/:id' do
  @user = User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  @space = Space.find_by_id(params['id'])
  erb :listing
end

get '/listings' do
  if session[:user_id] != nil then @user = User.find_by_id(session[:user_id]) end
  @spaces = Space.all
  erb(:'index')
end

post '/selected_listings' do
  @user = User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  filtered_spaces = Space.filter(date_from: params['requested_from'], date_to: params['requested_until'])
  session[:filtered_spaces] = filtered_spaces
  redirect '/selected_listings'
end

get '/selected_listings' do
  @user = User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  @spaces = session[:filtered_spaces]
  erb :selected_listings
end

get '/create-listing' do
  erb(:'create_listing')
end

post '/create-listing' do
  Space.create(
    name: params[:name], 
    description: params[:description], 
    price_per_day: params[:price_per_day],
    available_from: params[:available_from],
    available_to: params[:available_to],
    user_id: session[:user_id]
    )
  redirect '/listings'
end

  run! if app_file == $0
end
