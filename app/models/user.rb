class User < ActiveRecord::Base

  has_many :teachables, class: Teachable
  has_many :learnables, class: Learnable
  has_many :teachable_skills, through: :teachables, source: 'skill'
  has_many :learnable_skills, through: :learnables, source: 'skill'

end