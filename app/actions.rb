require 'byebug'
# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/register' do
  @user = User.new
  erb :'users/register'
end

post '/users/register' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/'
  else
    erb :'users/register'
  end
end

get '/users/login' do
  @user = User.new
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user
    # session[:user_id] = @user.id
    redirect '/'
  else
    @email = params[:email] || ""
    erb :'users/login'
  end
end 

# get '/users/logout' do
#   session[:user_id] = nil
#   redirect '/'
# end

# helpers do
#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end
# end

get '/users/profile' do
  erb :'users/profile/'
end

get '/search' do
  erb :'search'
end
