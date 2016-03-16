class UsersController < ApplicationController

	def new

	end

	def create

		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to Norton catalog ", @user.name 
			redirect_to '/songs'
		else
			flash[:error] = "There was a problem. Please try again"
			redirect_to :back
		end
	end

		private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end


