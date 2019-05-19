class Post < ApplicationRecord
	attachment :post_image
	attachment :post_sound
	
	has_many :comments
	has_many :favorites
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	belongs_to :user
	has_many :replies
end
