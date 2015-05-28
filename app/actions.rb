require 'byebug'
# Homepage (Root path)
get '/' do
  # if logged_in?
  #   erb :'dashboard/show'
  # else
    erb :index
  # end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/new'
  end
end

get '/session/new' do
  @user = User.new
  erb :'session/new'
end

post '/session/new' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @email = params[:email] || ""
    erb :'session/new'
  end
end 

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end
end

get '/profile' do
  erb :'users/profile'
end

get '/dashboard' do
  if current_user
    # byebug
    @current_user = current_user 
    @skills = Skill.all
    @num_of_users = User.count
    # @relationships = Relationship.all
    erb :'dashboard/show'
  else
    redirect 'session/new'
  end
end


