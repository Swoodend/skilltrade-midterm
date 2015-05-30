# Homepage (Root path)
get '/' do
  if logged_in?
    redirect '/dashboard'
  else
    erb :index
  end
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
    redirect '/dashboard'
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

get '/users/index' do
  if params[:search_by] == "username"
    @users = User.where(username: params[:query])
  elsif params[:search_by] == "skill"
    id_of_skill = Skill.where(name: params[:query])[0].id
    user_ids = Relationship.where(skill_id: id_of_skill).map &:user_id
    @users = []
    user_ids.each do |id|
      @users << User.find(id)
    end
    @users
  end
  erb :'/users/index'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/dashboard' do
  if logged_in?
    @user = current_user
    erb :'dashboard/show'
  else
    redirect 'session/new'
  end
end

