class ListingController < MakersBnB
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
end
