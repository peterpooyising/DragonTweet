class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # ========================================= Devise configurations ==================================================
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ======================================= Associations ==============================================================
  has_many :tweets, dependent: :destroy

  # Join Table (Following other users)
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id", # follower_id is the ID of the user who clicks on "follow".
                                  dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed # 'following' is Twitter's way of describing people that the user follows.

  # Join Table (Getting Followed)
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id", # followed_id is the ID of the user who gets followed by other Users.
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  # Visit https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/



  # ====================================== Validations ===============================================================
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 } # Because it's a new column we added in ourselves.

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # put this above email validaton or else uninitialised constant VALID_EMAIL_REGEX
  # validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4}, format: { with: VALID_EMAIL_REGEX }
  # validates :password, presence: true, length: { minimum: 1 }

=begin

# Note: This is DEVISE's User model.

Don't add in validations here because Devise already has validations in place for password, email, password confirmation etc. If we add in our own validations in the User model here, it will conflict with Devise's validation. The validations written here will affect the sign up form as well. For example, if we add in password validation here, it will conflict the sign in page because we will also need to ensure that the password is not blank in the sign up form as well.
=end


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
