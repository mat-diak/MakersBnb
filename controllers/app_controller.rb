require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/space'

class MakersBnB < Sinatra::Base
  configure :development do
    set :views, '../views'
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
  @spaces = Space.all
  erb(:'index')
end

post '/listing' do
  Space.create(name: params[:name], description: params[:description], price: params[:price])
  redirect '/listings'
end

  run! if app_file == $0
end
