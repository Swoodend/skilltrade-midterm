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

get '/users' do
  search = "%" + params[:query] + "%" if params[:query]
  if params[:search_by] == "username"
    @users = User.where("username LIKE ?", search)
    @not_found_message = @users if @users.empty?
  elsif params[:search_by] == "skill"
    @skills = Skill.where("name LIKE ?", search)
    if @skills.empty?
      @not_found_message = @skills
    else
      skill_ids = @skills.map &:id
      user_ids = Relationship.where(skill_id: skill_ids).map &:user_id
      @users = []
      user_ids.each do |id|
        @users << User.find(id)
      end
      @users
    end
  end
  erb :'/users/index'
end

get '/users/:id' do
  @user = User.find(params[:id])
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


get '/dashboard/edit' do
  if logged_in?
    @user = current_user
    erb :'dashboard/edit'
  else
    redirect 'session/new'
  end
end

post '/dashboard/edit' do
  
  if logged_in?
    @user = current_user
  else
    redirect 'session/new'
  end
  
  @user.update(
     username: params[:username],
     email: params[:email],
     password: params[:password]
     ) 
  if params[:add_teachable_skill] != "" && skill = Skill.find_by(name: params[:add_teachable_skill])
    Teachable.create(user: @user, skill: skill)
  end
  if params[:add_learnable_skill] != "" && skill = Skill.find_by(name: params[:add_learnable_skill])
    Learnable.create(user: @user, skill: skill)
  end
  redirect '/dashboard/edit'
end


