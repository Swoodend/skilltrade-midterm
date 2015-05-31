require 'faker'
#Configuration for seed file

NUMBER_OF_USERS = 123

skills = %w(programming plumbing baseball chess gardening algebra hockey baking cooking tennis badminton botany tv\ repair email\ support potty\ training dish\ washing fitness\ Hitman Knitting English spanish french Esperanto Pig\ Latin Persian Arabic Polish Luxembourgish painting sculpting phone\ repair calculus physics chemistry writing proof\ reading dog\ walking cat\ taming mindcraft clash\ of\ clans first\ person\ shooters tinder dating tree\ planting racecar\ driving car\ repair bike\ repair Rickshaw\ training noodle\ making tea\ bagging pizza-box\ folding spy drums guitar harp saxiphone trumbone Eating\ utensil\ etiquett baby-sitting, car\ washing spider\ squishing reading roof\ thatching)

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

#set non-duplicate initial values in teach and learn so that each user is gaurenteed a learnable and teachable
User.all.each do |user|
  initial_skills = skill_list.shuffle
  teach = []
  learn = []

  teach << initial_skills[0]
  learn << initial_skills[1]

#randomly make a teachables and learnables list that where each skill is unique and is not in both lists.
#the probability is that the  learn list will be longer than the the teach list 
  6.times do
    x = rand(1..8)
    skill = skill_list.sample
    if x == 1 || x == 2
      teach << skill unless teach.include?(skill) || learn.include?(skill)
    elsif x == 3 || x == 4 || x == 5
      learn << skill unless teach.include?(skill) || learn.include?(skill)
    end
  end

  teach.each do |skill|
    Teachable.create(user: user, skill: skill)
  end

  learn.each do |skill|
    Learnable.create(user: user, skill: skill)
  end

end
