class User < ApplicationRecord
	attachment :user_image
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	has_many :favorites, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :replies, dependent: :destroy

	has_many :active_relationships, class_name: "Relationship",
									 foreign_key: "follower_id",
									 dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
									 foreign_key: "followed_id",
									 dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships

	validates :name, presence: true
	validates :email, uniqueness: true
	validates :profile, length: {maximum: 128} 

	# フォローする
	def follow(other_user)
    following << other_user
  	end

 	# フォロー解除する
	def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
	end

  	# 現在のユーザーがフォローしてたらtrueを返す
	def following?(other_user)
    following.include?(other_user)
	end

  	# 現在のユーザーにフォローされていたらtrueを返す
	def followers?(other_user)
	followers.include?(other_user)
	end
end
