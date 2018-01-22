class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.text :content, null: false
      t.references :user, foreign_key: true # Tweets belongs to User. This step is like creating a User(which is a Parent) column and adding the foreign key of the tweet's Parent inside the User column.

      t.timestamps
    end
  end
end

# ============================================== Note ==================================================================
=begin
A one-to-many association is probably the most common and widely used type. The idea is pretty simple: record A may have many records B and record B belongs to only one record A. For each record B you have to store an id of the record A it belongs to – this id is called a foreign key.

Let’s try it in practice. Suppose, we have a user that may have a bunch of posts. First of all, create the User model:

$ rails g model User name:string

As for the posts table, it has to contain a foreign key and the convention is to name this column after the related table, so in our case that would be user_id (note the singular form):
# Command Line in Terminal

$ rails g model Post user:references body:text

user:references is a neat way to define a foreign key – it will automatically name the corresponding column user_id and add an index on it. Inside your migration you’ll see something like:

t.references :user, foreign_key: true

Of course, you can also say:

$ rails g model Post user_id:integer:index body:text

=end
