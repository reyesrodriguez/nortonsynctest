class UsersController < ApplicationController

	def new

	end

	def create

		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "welcome to Norton catalog!"
			redirect_to '/songlist'
		else
			flash[:alert] = "there was a problem. Please try again"
			redirect_to :back
		end
	end

		private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end
	end


