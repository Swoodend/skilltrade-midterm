class SingularizeForeignKeys < ActiveRecord::Migration
  
  def change
      rename_column :relationships, :users_id, :user_id
      rename_column :relationships, :skills_id, :skill_id
  end

end
