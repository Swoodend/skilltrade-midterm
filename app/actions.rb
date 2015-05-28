# Homepage (Root path)
get '/' do
  erb :index
end

get '/dashboard' do

  erb :'/dashboard/show.erb'
end
