module SessionsHelper
	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def authenticate
		if current_user.nil?
			redirect_to "/log-in"
	end
end
end
