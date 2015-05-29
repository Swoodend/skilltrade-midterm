class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true

  has_many :teachables
  has_many :learnables

  has_many :teachable_skills, through: :teachables, source: 'skill'
  has_many :learnable_skills, through: :learnables, source: 'skill'

  #
  # scope :learners_seeking_skills, -> (skills_id_array){ joins(:learnables).where(:relationships => {:skill_id => skills_id_array}) }

  # def teachable_skill_ids
  #   teachables.map &:skill_id
  # end

  # def learners_seeking_my_teachables
  #   User.learners_seeking_skills(teachable_skill_ids)
  # end

  def find_my_teachers
    User.joins(learnables: {skill: {teachables: :user}}).where("users_relationships.id = ?", id)
  end

  def find_my_students
    User.joins(teachables: {skills: {learnables: :users}}).where("users_relationships.id = ?", id)
  end

end

