class Reply < ApplicationRecord
	attachment :reply_image
	attachment :reply_sound
	
	belongs_to :post
	belongs_to :user
end
