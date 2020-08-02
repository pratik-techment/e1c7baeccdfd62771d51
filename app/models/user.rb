class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :tweets, dependent: :destroy

   has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

   has_many :passive_relationships, class_name:  "Relationship",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy


    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

   def feed(sort_type)
   following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
     if sort_type == "asc"
      Tweet.where("user_id IN (#{following_ids})", user_id: id).order('tweets.created_at asc')
      else
      Tweet.where("user_id IN (#{following_ids})", user_id: id).order('tweets.created_at desc')
    end
   end


  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # def generate_jwt
  #   JWT.encode({ id: id,
  #               exp: 60.days.from_now.to_i },
  #              Rails.application.secrets.secret_key_base)
  # end
end
