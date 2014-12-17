#  contains the routes related to listing, creating, and redirecting Url objects

# get '/home' do
#   @urls = Url.all
#   erb :home
# end

# post '/home' do
#     @urls = []
#     if login?
#       @urls = Url.all
#     end
#   erb :home
# end


get '/urls' do
  @urls = Url.all
  erb :home
end

post '/urls' do
  # create a new Url
  puts params
  @urls = Url.all
  @url = Url.create(url: params[:url])

  redirect to ('/home')
end


# e.g., /q6bda
get '/short_url/:short_url' do
  puts "======================================================"
  puts params
  @urls = Url.all
  @object_url = Url.where(shorten_url: params[:short_url]).first
  # Url.find(1 or 2, 3) <--- This you put the ID
  p @object_url
  @object_url.click_count
  # @object_url.times_clicked += 1
  # @object_url.save



  # Can use this way too, find_by_*("") (* is the column name)
  # Url.find_by_shorten_url("xxx")

  # 1. Make the index as click able with the shorten_url - Done
  # 2. In the get here, get the params for short_url
  # 3. Use the params to query in the Url model to get the original url
  # 4. Redirect to the original URL
  # redirect to appropriate "long" URL
  redirect @object_url.url
end