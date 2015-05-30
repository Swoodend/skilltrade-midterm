class UsersImporter

  def self.import

    database = ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'db/db.sqlite3'
    )

    User.create(username: 'John', email: 'john@gmail.com', password: 'password1234', user_img: 'http://thumb101.shutterstock.com/display_pic_with_logo/238468/141327337/stock-photo-happy-man-giving-okay-sign-portrait-on-white-background-141327337.jpg')
    User.create(username: 'Stacey', email: 'stacey@gmail.com', password: 'p1234321', user_img: 'http://speakingaboutpresenting.com/wp-content/uploads/2009/01/younger-business-woman.jpg')
    User.create(username: 'Kevin', email: 'kev@gmail.com', password: 'kev28883')

    # database.connection.execute("INSERT INTO USERS(id, username, email, password, created_at, updated_at, user_img)
    #   VALUES(1, 'John', 'john@gmail.com', 'password1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'http://thumb101.shutterstock.com/display_pic_with_logo/238468/141327337/stock-photo-happy-man-giving-okay-sign-portrait-on-white-background-141327337.jpg';")

    # database.connection.execute("INSERT INTO USERS(id, username, email, password, created_at, updated_at, user_img)
    #   VALUES(2, 'Stacey', 'stacey@gmail.com', 'p1234321', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'http://speakingaboutpresenting.com/wp-content/uploads/2009/01/younger-business-woman.jpg';")

    # database.connection.execute("INSERT INTO USERS(id, username, email, password,created_at, updated_at, user_img)
    #   VALUES(3, 'Kevin', 'kev@gmail.com', 'kev28883', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
    #   VALUES(1, 'programming', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);") 

    # database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
    #   VALUES(2, 'plumbing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
    #   VALUES(3, 'yoga', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);") 

    # database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
    #   VALUES(4, 'surfing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
    #   VALUES(1, 1, 1, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
    #   VALUES(2, 1, 2, 'Teachable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at)  
    #   VALUES(3, 2, 2, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
    #   VALUES(4, 2, 1, 'Teachable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    # database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
    #   VALUES(5, 3, 2, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
      VALUES(6, 1, 2, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
      VALUES(7, 1, 3, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, user_id, skill_id, type, created_at, updated_at) 
      VALUES(8, 1, 4, 'Learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

  end

end
