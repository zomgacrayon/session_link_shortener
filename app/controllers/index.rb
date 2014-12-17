 get '/' do
  @url = Url.all
  erb :index
end