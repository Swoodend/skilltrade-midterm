class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

  has_many :teachables, class: Teachable
  has_many :learnables, class: Learnable
  has_many :teachable_skills, through: :teachables, source: 'skill'
  has_many :learnable_skills, through: :learnables, source: 'skill'

end