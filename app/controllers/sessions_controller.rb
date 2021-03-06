class SessionsController < ApplicationController

	before_filter :save_login_state, :only => [:login, :login_attempt]


  	def login
  		@titre = "Login"
	end



	def login_attempt
  		authorized_user = User.authenticate(params[:username],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:success] = "Welcome #{authorized_user.username}"
			if authorized_user.group.id == 1
				redirect_to :controller => "dreams", :action => "tag"
			else
				redirect_to(:root)
			end
			
		else
			flash[:error] = "Invalid Username or Password"
			render "login"	
		end
	end


	def logout
		flash[:success] = "Logout success"
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
end
