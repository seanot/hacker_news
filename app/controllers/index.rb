#GETS============================================

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/post/:id/comments' do

end

get '/user/:id' do

end

get '/access' do
  erb :access
end

get '/post' do
    redirect to('/post/new')
end

#POSTS============================================

post '/access/login' do
  if User.authenticate(params[:user])
    user = User.find_by_email(params[:user][:email])
    p user
    session[:user] = user.id
    puts "this is the session variable #{session[:user]}"
    redirect to('/')
  else
    redirect to('/')
  end
end

post '/access/create' do
  user = User.new(:email => params[:email], :password => params[:password])
  if user.save
    session[:user] = user.id
    puts "this is the session variable #{session[:user]}"
    @msg = "Thanks for signing up #{user.email}!"
    redirect to('/')
  else
    @errors = user.errors.full_messages
    erb :access
  end
end


post '/submit_post/' do
end

post 'submit_comment/' do

end


