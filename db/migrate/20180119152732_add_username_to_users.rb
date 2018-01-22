class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change #anything inside of this method, is translated to SQL code and modified the database.
    add_column :users, :username, :string , null: false # add a new column to table "users", called "username" and of type "string"
    add_index :users, :username, unique: true # first, index usernames for quick lookup. Second, ensure usernames are ALWAYS unique.
  end
end
