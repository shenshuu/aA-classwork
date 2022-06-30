class CreateUserChanges < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username 
    add_column :users, :username, :string, unique: true 
  end
end
