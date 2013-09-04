require 'faker'

10.times do 
  User.create(
    :email => Faker::Internet.email,
    :password => '123',
    )
end 


50.times do 
  Post.create(
    :title => Faker::Lorem.word,
    :body => 'nyt.com',
    )
end 

100.times do
  Comment.create(
    :content => Faker::Lorem.sentence,
    :post_id => rand(1..50),
    :user_id => rand(1..10)

    )
end