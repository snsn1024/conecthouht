class Post < ApplicationRecord
	has_many :comments
	has_many :favorites
	belongs_to :gunre
	belongs_to :user
end
