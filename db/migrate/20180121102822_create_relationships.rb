class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      # t.integer :follower_id  # id of the person who follows other users by clicking on the "follow" button.
      # t.integer :followed_id  # id of the person who gets followed.

      t.references :follower  # can't do "foreign_key: true" because :follower is NOT a MODEL, it is a COLUMN.
      t.references :followee  # can't do "foreign_key: true" because :followee is NOT a MODEL, it is a COLUMN.

      t.timestamps
    end

    # Note: Need this line of code in order for Rails to know where to look for the foreign key(s).
    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :followee_id

    # add_index :relationships, :follower_id
    # add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
end

# ================================================ Note ============================================================
=begin
  Can also use the "t.integer" method to add associations.
  If so, the change will be to use "add_index" method instead of the "foreign_key: true" method. (Not entirely sure about this.)
=end
