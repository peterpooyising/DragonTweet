class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags

  validates :content, presence: true, length: { maximum: 140 } # maximum tweet length of 140 CHARACTERS not WORDS!

  MAX_WORD_COUNT = 140

  # ====================================== Pagination (will_paginate) =================================================

  # ===================================== Search function (pg_search) ==================================================
  # pg_search_scope :search,
  #                 against: :body,
  #                 using: {
  #                   tsearch: {prefix: true}
  #                 }
  include PgSearch
  pg_search_scope :search,
                  against: :content,
                  using: { trigram: { threshold: 0.03 } }
                  
  # ======================================= Helper Methods ============================================================
  # Return all tags in tweet in array format
  def scan_tags
    self.content.scan(/#\w+/).uniq
  end
  # Visit: http://rubular.com/
=begin
    Regular Expression
    #   :   A literal string of "#".
    //  :   Forward slashes demarcates the beginning and the end of a Regular Expression.
    \w  :   Any word character (letter , number , underscore)
    +   :   More than 1. This is delimited by an empty space(it ends when it encounters an empty space).
=end

  def save_with_tags
    self.save
    tags = self.scan_tags
    tags.each do |tag|
      if Tag.exists?(name: tag)  # The argument in the parenthesis is to:    search the "content" column for a the "tag" record and checks if it exists
        tag_id = Tag.find_by(name: tag).id   # if it exists, extract its ID and assign it to a variable called "tag_id"
        self.tweet_tags.create(tag_id: tag_id)  # then go to the tweet_tags(associated with the tweet) and go to the "tag_id" column and create a record(which is this variable "tag_id")
      else
        self.tags.create(name: tag) # tag here refers to "#<tag>"(words) as written in the tweet itself. NOT the ID(integer) of the tag.
      end
      return self   # return the tweet so we can continue do things with the tweet itself.
    end


  end


=begin
============================================= Overview of Problem ========================================================
What I need to do is to extract the tag from the tweet and store it in the database. I achieve this with the helper method "scan_tags" & "save_with_tags". They require a few steps in the following sequence:

(1) The ability to recognise that it is a tag and not just plain words.
Solution: Use REGEX via the helper method "scan_tags"

# ======= "save_with_tags" Else clause ========
(2) Take that tag(s)(represented as "#<whatever-you-name-it-to-be>") and insert it as a record into the name column of the tag table.

# ======== "save_with_tags" If clause =========
(3) When we want to check if a particular tag exists, we just go to the name column of the tag table and search for it. If it exists, we assign its ID(primary key: an integer) and assign it as a variable "tag_id".

(4) Then we go to the tweet_tags table (all the tweet_tags records that are associated with the tweet itself) and we create a record of "tag_id"(primary key; an integer) in the tag_id column for all the different & unique tags. This means that a new tweet_tag record(that already has the tweet ID field populated by a single tweet ID. This is because all the tweet_tag records that are going to be created all belong a particular tweet) is created for each different and unique tag ID.


IMPORTANT: When we are dealing with a "FOREIGN KEY" column we need to add "_id" at the end of the column name. e.g in tweet_tags table, we have 2 FOREIGN KEY columns - "tweet" column and "tag" column. (denoted by "t.references" and "foreign_key: true") To access them, we use "tweet_id:" or "tag_id:" instead of "tweet:" or "tag:"

============================================= Methods Explanation ========================================================
exists? method
    The exists? method has the advantage that is not selecting the record from the database (meaning is faster than selecting the record). The query looks like:

        SELECT 1 FROM trucks where trucks.id = 10

refer to https://stackoverflow.com/questions/18082778/rails-checking-if-a-record-exists-in-database



.where / .find /  .find_by  difference
    find => This return single record if the given primary_key(id) exists in the system otherwise in will give an ERROR.

    Model.find(required_id_value)
    find_by => This will return single record depends on the given attribute, and if the value of the attribute does not exist in the DB it will return NIL.

    Model.find_by_name("your name")
    name here is the ATTRIBUTE and it must be exist in your Modal.

    where => This will return an active record relation with zero or more records you need to use first to return only one record or nil in case zero records return. Benefit: Can chain commands.

    Model.where(id: id_value).first


refer to https://stackoverflow.com/questions/15185919/whats-the-difference-between-find-where-and-find-by-id

=end
end
