class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # ========================================= Devise configurations ==================================================
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ======================================= Associations ==============================================================
  has_many :tweets, dependent: :destroy



  # ================================================ Relationship ===================================================

  # Definitions
  # Followee:   a person who is BEING TRACKED on a social media website or application.
  # Follower:   a person who ACTIVELY TRACKS another person/other people on a social media website or application.

  # Visit https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
  # Visit https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/


  # Usage
=begin
  To determine a User’s :followees (upon an @user.followees call), Active Record may now look at each instance of class_name: “Follow” where such User is the follower (i.e. foreign_key: :follower_id) through: such User’s :followee_follows. To determine a User’s :followers (upon an @user.followers call), Active Record may now look at each instance of class_name: “Follow” where such User is the followee (i.e. foreign_key: :followee_id) through: such User’s :follower_follows.
=end



  # ======================================== Join Table (Following other users) =======================================
  has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy # one-to-many relationship. Example: This allows a single user(current_user) to follow other users.

  has_many :followees, through: :active_relationships  # many-to-many relationship. Example: This allows the User model to have many such single user(current_user) who can follow other users.


  # Follows the logic of the Tweet / Tweet_Tag / Tag example. A Tweet has many Tweet_Tags. A Tweet has many Tags through Tweet_Tags.

  # However, at this point it is not a complete 2-way relationship. The follower is linked to the followee but the followee is not linked to the follower. In order to complete the relationship and link the followee to the follower, we need to do the same thing for followee as well.


  # ======================================= Join Table (Getting Followed) ================================================
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followee_id, dependent: :destroy # one-to-many relationship. Same logic as above.

  has_many :followers, through: :passive_relationships  # many-to-many relationship. Same logic as above.




  # ====================================== Validations ===============================================================
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 } # Because it's a new column we added in ourselves.

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # put this above email validaton or else uninitialised constant VALID_EMAIL_REGEX
  # validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4}, format: { with: VALID_EMAIL_REGEX }
  # validates :password, presence: true, length: { minimum: 1 }

=begin

# Note: This is DEVISE's User model.

Don't add in validations here because Devise already has validations in place for password, email, password confirmation etc. If we add in our own validations in the User model here, it will conflict with Devise's validation. The validations written here will affect the sign up form as well. For example, if we add in password validation here, it will conflict the sign in page because we will also need to ensure that the password is not blank in the sign up form as well.
=end

  # ======================================= Search Function (pg_search) ===============================================







  # ===================================== Helper Methods ===============================================================
  def follow(user)
    return self.followees << user if self.following?(user) == false && self != user
  end

  def unfollow(user)
    return self.followees.delete(user)
  end

  def following?(user)
    return self.followees.include?(user) # return true or false
  end

  # Return users that current_user is not following
  def not_following
    following_ids = self.followees.ids + [self.id] # need to enclose own ID inside [] in order to join it into the array of other IDs that current_user is following.
    return User.where.not(id: following_ids)
  end

  # Return tweets that belong to the people that current_user is following as well as his own tweets.
  def feed
    following_ids = self.followees.ids + [self.id]
    Tweet.where(user_id: following_ids).order(created_at: :desc)
  end




  # ===================================== Facebook Login ============================================================
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
