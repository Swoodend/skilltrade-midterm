class CreateInitialTables < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.string :username, :email, :password
      t.timestamps null: false
    end

    create_table :skills do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :relationships do |t|
      t.belongs_to :users, :skills
      t.string :type
      t.timestamps null: false
    end

  end

end
