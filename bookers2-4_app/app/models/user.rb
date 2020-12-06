class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  
  def follow(user_id)
  follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
  following_user.include?(user)
  end
  
  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end
  
  # def unfollow(other_user)
  #   relationship = self.relationships.find_by(follow_id: other_user.id)
  #   relationship.destroy if relationship
  # end
  
  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end
  
  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
