class User < ApplicationRecord

	attachment :user_image
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	has_many :favorites
	has_many :posts

end
