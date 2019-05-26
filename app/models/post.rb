class Post < ApplicationRecord
	acts_as_taggable
	
	attachment :post_image
	attachment :post_sound
	
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	belongs_to :user
	has_many :replies, dependent: :destroy

	validates :post_title, length: {maximum: 128} 
	validates :post_text, length: {maximum: 256} 
end
