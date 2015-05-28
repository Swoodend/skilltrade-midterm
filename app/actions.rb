# Homepage (Root path)
get '/' do
  erb :index
end

get '/register' do
  @user = User.new
  erb :'/users/register'
end

post '/users/register'
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/'
  else
    erb :'/users/register'
end

get '/login' do
  @user = User.new
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/login'
  end
end 

get '/profile' do
  erb :'/profile/'
end

get '/search' do
  erb :'/search'
end
