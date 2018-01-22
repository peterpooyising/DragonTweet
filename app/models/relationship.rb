class Relationship < ApplicationRecord

  belongs_to :follower_id, class_name: 'User'
  belongs_to :followed_id, class_name: 'User'

end


# =============================================== Note ===================================================================
=begin

  follower_id & followed_id are NOT MODEL(S). They are COLUMN(S) in a model. So Rails will not know how to look for them unless we put a "class_name" attribute to specify which model to look into.

=end
