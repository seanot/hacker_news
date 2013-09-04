#GETS============================================

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/post/:id/comments' do

end

get '/user/:id' do

end

get 'access' do
  
end
#POSTS============================================

post '/access' do

end

post '/submit_post/' do
end

post 'submit_comment/' do

end


