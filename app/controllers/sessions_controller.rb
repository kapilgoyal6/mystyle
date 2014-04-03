class SessionsController < ApplicationController

	def new
		if current_user
			redirect_to "/home"
		else
			render :layout => false
		end
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
  	@profile = Profile.create(:user_id => current_user.id)

			# redirect_to root_url, :notice => "Logged in!"
			redirect_to "/home"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out Successfully!"
	end
end
