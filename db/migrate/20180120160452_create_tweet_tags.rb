class CreateTweetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_tags do |t|

      t.references :tweet, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end


# ============================================== Note =====================================================================
=begin

  The order of migration files is IMPORTANT! The order in which migrations are run is based on the time stamp of the migration - as indicated in the name of the file.

  Or else there will be an ERROR. Make sure "tweet_tags" migration file is after "tags" & "tweets" migration files. Change the timestamp manually so "tweet_tags" migration file is on top of them in the db/migrate folder.

=end
