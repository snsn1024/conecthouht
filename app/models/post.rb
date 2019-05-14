class Post < ApplicationRecord
	has_many :comments
	has_many :favorites
	# belongs_to :genre
	belongs_to :user
	has_many :replies
end
