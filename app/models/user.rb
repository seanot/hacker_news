class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments
  has_many :votes #through?

  validates :email, uniqueness: true

  def self.authenticate(user_hash)
    if self.find_by_email(user_hash[:email])
      self.find_by_email(user_hash[:email]).password == user_hash[:password]
    else
      false
    end
  end
end
