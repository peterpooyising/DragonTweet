class Tag < ApplicationRecord

  # ============== Associations ===================
  has_many :tweet_tags  # No dependent: :destroy because if I were to destroy a tag, I will not want to delete the correspondng tweet because I only want to destroy the tag itself.
  has_many :tweets, through: :tweet_tags


  # ============= Validations =====================
  validates :name, presence: true, uniqueness: true # avoid duplicates.


  # ========================================= Search function (pg_search) ==================================================









  # =========================================== Helper methods ===========================================================
  # Return the top 10 tags with the most number of tweets.

  # Class method (denoted by "self" in the method name)
  def self.top_10
    tag_ids = TweetTag.group(:tag_id).order('count_all desc').limit(10).count.keys
    self.find(tags_ids)
  end

end
  # Watch: https://www.youtube.com/watch?v=s0KTEtVQ_AY

  # TweetTag.group(:tag_id)    ->   Group all tweettags according to the the ID of the TAGS. So if tweettags have the same TAG ID, group them together.

  # .order('count_all DESC')   ->   Sort all the tweettags(grouped by TAG ID now) according to their count in DESCENDING order.

  # .limit(10)                 ->   Limit to the top 10 ( with the most number of count)

  # .count                     ->   Count the number of tweettags(and hence tags of the same ID) within that grouped TWEETTAG(single tweettag).

  # .keys                      ->   Access the key(the TWEETTAG(single) that is grouped by the ID of a TAG). Essentially this means accessing the TAG ID.

# ================ Example =================
=begin

prods = Product.group(:price).count

puts prods
=> { 573 => 3, 578 => 2, 583 => 3 , 588 => 4, 596 => 3, 598 => 2 }

Explanation
A hash is returned. On the left side is the PRICE(the group attribute). On the right side is the COUNT. So we are saying of the products that cost $573, there are 3 of them; of the products that cost $596, there are also 3 of them.

To return an array of just the keys, we add .keys at the back, e.g
#     hash = {"apple" => "fruit", "carrot" => "vegetable"}
#     array = hash.keys   #=> ["apple", "carrot"]


  # self is a way to refer within a class method to the object to which the method is being applied (the instance of the partcular class). Watch: https://www.youtube.com/watch?v=_--3ixDv4nE

=end

# ============================================== End of Helper Methods =================================================

# ============================================= Notes ====================================================================
=begin

==================== Question =====================
Suppose User has many Receipt and I would like all the instances of Receipt to be destroyed when the parent User instance gets deleted.

What is the difference between writing:

(1) In User model, has_many :receipts, dependent: :destroy

(2) In Receipt model, belongs_to :user, dependent: :destroy

Any suggestions?

===================== Answer ======================
(1) In User model, has_many :receipts, dependent: :destroy

If user is destroyed than its associated receipnts will be destroyed as well.

(2) In Receipt model, belongs_to :user, dependent: :destroy

If receipt is destroyed than its parent user will be destroyed. Note: other associated receipts would not be destroyed but would be orphaned. According to docs:

      "This dependent: option should not be specified when belongs_to is used in conjunction with a has_many relationship on another class because of the potential to leave orphaned records behind."


you can specify the :dependent option with following three forms:
    (1)  :destroy/:destroy_all The associated objects are destroyed alongside this object by calling their destroy method
    (2)  :delete/:delete_all All associated objects are destroyed immediately without calling their :destroy method
    (3)  :nullify All associated objects' foreign keys are set to NULL without calling their save callbacks


===================== Summary ======================
In other words, use the "dependent: :destroy" on the parent with a "has_many" association only.


=end


# methods that end with "?" is a stylistic convention of Ruby telling us that this is going to be a Boolean valued method that is going to return True / False.
