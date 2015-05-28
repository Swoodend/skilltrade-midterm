class UsersImporter

  def self.import

    database = ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'db/db.sqlite3'
    )
    
    database.connection.execute("INSERT INTO USERS(id, username, email, password, created_at, updated_at)
      VALUES(1, 'John', 'john@gmail.com', 'password1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO USERS(id, username, email, password, created_at, updated_at)
      VALUES(2, 'Stacey', 'stacey@gmail.com', 'p1234321', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO USERS(id, username, email, password,created_at, updated_at)
      VALUES(3, 'Kevin', 'kev@gmail.com', 'kev28883', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
      VALUES(1, 'programming', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);") 

    database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
      VALUES(2, 'plumbing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
      VALUES(3, 'yoga', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);") 

    database.connection.execute("INSERT INTO SKILLS(id, name, created_at, updated_at)
      VALUES(4, 'surfing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, users_id, skills_id, type, created_at, updated_at) 
      VALUES(1, 1, 1, 'learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, users_id, skills_id, type, created_at, updated_at) 
      VALUES(2, 1, 2, 'teachable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, users_id, skills_id, type, created_at, updated_at)  
      VALUES(3, 2, 2, 'learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, users_id, skills_id, type, created_at, updated_at) 
      VALUES(4, 2, 1, 'teachable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

    database.connection.execute("INSERT INTO RELATIONSHIPS(id, users_id, skills_id, type, created_at, updated_at) 
      VALUES(5, 3, 2, 'learnable', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);")

  end

end
