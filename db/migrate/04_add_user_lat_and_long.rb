class AddUserLatAndLong < ActiveRecord::Migration

  def change
    add_column :users, :lat, :integer
    add_column :users, :long, :integer
  end

end