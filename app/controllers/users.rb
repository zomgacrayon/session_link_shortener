require 'pry'
# contains the routes related to creating, displaying, and editing users
get '/signup' do
  erb :index
end

post '/signup' do
  puts "=========================================="
  puts params
  user = User.create(email: params[:email], password: params[:password])

  if user.valid?
    session[:user_id] = user.id
    redirect '/home'
  else
    redirect '/error_page'
  end
end

get '/error_page' do
  erb :error_page
end