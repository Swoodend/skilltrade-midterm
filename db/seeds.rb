require 'faker'
#Configuration for seed file

NUMBER_OF_USERS = 30
skills = %w(programming plumbing baseball chess gardening linear\quit algebra hockey)
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

#Give some users teachables
(NUMBER_OF_USERS * 2).times do
  Teachable.create(user: users_list.sample, skill: skill_list.sample)
end

#give some users learnables

(NUMBER_OF_USERS * 2).times do
  Learnable.create(user: users_list.sample, skill: skill_list.sample)
end
