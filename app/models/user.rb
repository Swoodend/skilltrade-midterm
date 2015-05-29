class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

  has_many :teachables, class: Teachable
  has_many :learnables, class: Learnable

end