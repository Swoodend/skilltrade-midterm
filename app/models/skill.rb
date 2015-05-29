class Skill < ActiveRecord::Base

  validates :name, presence: true

  has_many :teachables
  has_many :learnables

  has_many :teachers, through: :teachables, source: 'user'
  has_many :learners, through: :learnables, source: 'user'

end