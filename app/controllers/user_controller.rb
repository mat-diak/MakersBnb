class UserController < ListingController
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
end