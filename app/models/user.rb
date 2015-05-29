class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

  has_many :teachables, through: :relationships
  has_many :learnables, through: :relationships

end