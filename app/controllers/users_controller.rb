class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :following, :followers]
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@favorites = @user.favorites
	end

	def create
		@user = User.new(user.params) 
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user.id)
	end

	def following
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user  = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	private
	def user_params
		params.require(:user).permit(:name,:profile,:user_image)
	end
end
