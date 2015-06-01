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

  #returns and array of User object of people who can teach you want you want to learn
  def find_my_teachers
    User.joins(teachables: {skill: {learnables: :user}}).where("users_relationships.id = ? and users.id != ?", id, id).distinct
  end

  #returns and array of User object of people who can learn you want you want to teach
  def find_my_students  
    User.joins(learnables: {skill: {teachables: :user}}).where("users_relationships.id = ? and users.id != ?", id, id).distinct
  end

  def i_learn_they_teach(user)
     (learnable_skills.map &:name) & (user.teachable_skills.map &:name)
  end

  def i_teach_they_learn(user)
     (teachable_skills.map &:name) & (user.learnable_skills.map &:name)
  end

  #returns an array of User objects
  def find_people_I_want_to_meet
    find_my_teachers & find_my_students
  end

  # def 3_way_matches
  #   my_teachers = find_my_teachers
  #   my_students = find_my_students

  #   teachers_of_my_teachers = []


  #   my_teachers.each do |teacher|
  #     teacher.find_my_teachers

  #   end

  #     # do my stuents have any students that are my teacherss. or same thing, does my teacher have any teachers who are my students
  #   end

end

