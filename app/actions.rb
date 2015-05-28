# Homepage (Root path)
get '/' do
  erb :index
end

get '/profile' do

  erb :'/dashboard/show.erb'
end
