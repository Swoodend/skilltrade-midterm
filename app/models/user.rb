class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

end