class SessionsController < ApplicationController
	
	def create 
	   @user = User.authenticate(params[:name], params[:password])
	if @user
		flash[:success]= "You've been logged in as " + @user.name 
		session[:user_id] = @user.id 
		redirect_to "/songs"
	else
		flash[:error] = "There was a problem logging you in."
		redirect_to log_in_path
	end
end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have been logged out successfully."
		redirect_to "/"
	end
end

