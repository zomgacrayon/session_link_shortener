# contains the routes related to logging in and logging out
set :protection, except: :session_hijacking

def login?
  if session[:user]
    return true
      else
    return false
  end
end

get '/login' do
  erb :index
end

post '/login' do

 user = User.authenticate(params[:user][:email], params[:user][:password])

    if !user
      redirect to ('/error_page')
    else
  puts "======================================="
  p session[:user_id]
  p "=====end===="
  puts params
    session[:email] = user.email
    redirect to ('/home')
  end
end

get '/home' do
  @urls = Url.all
  erb :home
end

post '/home' do
  @urls = []
    if login?
      @urls = Url.all
    end
  erb :home
end

get '/logout' do
  session[:email] = nil
  redirect "/"
end