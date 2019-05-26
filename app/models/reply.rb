class Reply < ApplicationRecord
	attachment :reply_image
	attachment :reply_sound
	
	belongs_to :post
	belongs_to :user

	validates :reply_title, length: {maximum: 128} 
	validates :reply_text, length: {maximum: 256} 

end
