class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      # t.integer :follower_id  # id of the person who follows other users by clicking on the "follow" button.
      # t.integer :followed_id  # id of the person who gets followed.
      t.references :follower
      t.references :followee
      t.timestamps
    end


    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :followee_id

    # add_index :relationships, :follower_id
    # add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
end
