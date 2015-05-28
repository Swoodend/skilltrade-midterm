class Skill < ActiveRecord::Base

  validates :name, presence: true

  has_many: users, through: :relationships

end