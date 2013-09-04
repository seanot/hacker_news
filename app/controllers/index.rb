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


#POSTS============================================

post '/access' do
  user = User.find_or_create_by_name(params[:email], params[:password])


end

post '/submit_post/' do
end

post 'submit_comment/' do

end


