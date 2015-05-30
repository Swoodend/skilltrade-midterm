require 'faker'
#Configuration for seed file

NUMBER_OF_USERS = 30
skills = %w(programming plumbing baseball chess gardening linear\ algebra hockey)
#Create some users

User.create(
    username: 'Logan',
    email: 'logan@gmail.com',
    password: 'test',
    user_img: 'https://pbs.twimg.com/profile_images/567974299374325760/glHHUddb.jpeg'

    
  )
users_list = []
NUMBER_OF_USERS.times do
  users_list << User.create(

    username: Faker::Name.name ,
    email: Faker::Internet.email,
    password: 'test',
    user_img: Faker::Avatar.image(Faker::Internet.slug)
  )
end

#Create some skills
skill_list = []

skills.each do |skill|
  skill_list << Skill.create(name: skill)
end

User.all.each do |user|
  teach = []
  learn = []

  skill_list.each do |skill|
    x = rand(1..3)
    if x == 1
      teach << skill
    elsif x == 2
      learn << skill
    end
  end

  teach.each do |skill|
    Teachable.create(user: user, skill: skill)
  end

  learn.each do |skill|
    Learnable.create(user: user, skill: skill)
  end

end
