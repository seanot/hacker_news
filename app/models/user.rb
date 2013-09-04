class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments
  has_many :votes #through?

  validates :email, uniqueness: true
end
