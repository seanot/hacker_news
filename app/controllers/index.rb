#GETS============================================

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end


get '/user/:id' do

end

get '/access' do
  erb :access
end

get '/post' do
    erb :new_post
end

get '/comments/post/:post_id' do
  @post = Post.find(params[:post_id])
  p @post# 
  p "the post id is #{@post.id}"
  # redirect to("/comments/post/#{@post.id}")
  erb :comments
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


post '/submit_post' do
  current_user
  post = Post.create(:title => params[:title], :body => params[:body], :user_id => current_user.id)
  redirect to('/')
end

# post '/comments/post_id' do
#   @post = Post.find(params[:post_id])
#   # redirect to('/comments/post/#{@post.id}')
#   erb
# end


post '/submit_comment/:post_id' do
  current_user
  @post = Post.find(params[:post_id])
  comment = Comment.create(:content => params[:content], :user_id => current_user.id, :post_id => params[:post_id])
  
  erb :comments
end


