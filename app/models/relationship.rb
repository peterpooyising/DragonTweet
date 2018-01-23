class Relationship < ApplicationRecord

  belongs_to :follower, class_name: 'User'  # Note: It's belongs_to ":follower", not ":follower_id". Don't need to include "_id" at the back of the column name, If I put :follower_id, there'll be an ERROR!!! It is like saying "belongs_to :tag_id" when we should be saying "belongs_to :tag".

  belongs_to :followee, class_name: 'User'   # Note: It's belongs_to ":followed", not ":followed_id". Don't need to include "_id" at the back of the column name, If I put :followed_id, there'll be an ERROR!!! It is like saying "belongs_to :tag_id" when we should be saying "belongs_to :tag".

end


# =============================================== Note ===================================================================
=begin

  follower & followed are NOT MODEL(S). They are COLUMN(S) in a model. So Rails will not know how to look for them unless we put a "class_name" attribute to specify which model to look into.

=end


# ============================================== Method 2 =================================================================
=begin

  belongs_to :follower, foreign_key: "follower_id", class_name: 'User'
  belongs_to :followee, foreign_key: "followee_id", class_name: 'User'

=end
