require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'
require_relative './database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  'Hello world!'
end

get '/new' do
  erb(:new_space)
end

get '/listings' do
  @spaces = Space.all
  erb(:index)
end

post '/listing' do
 
  Space.create(name: params[:name], description: params[:description], price_per_day: params[:price_per_day])
  redirect '/listings'
end

  run! if app_file == $0
end
