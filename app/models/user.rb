class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

  has_many :skills, through: :relationships

end