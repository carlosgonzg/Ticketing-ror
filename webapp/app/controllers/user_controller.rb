class UserController < ApplicationController
    skip_before_filter :require_login
	def index
	end
	def create
		answer = User.authenticate(params[:Username],params[:Password])
		if answer == 0 then
			session[:User] = User.find(:all,:conditions=>"Username = '#{params[:Username]}'")
			redirect_to new_request_path
		elsif answer == -1
			flash[:error] = "Incorrect Password"
			redirect_to login_user_index_path
		else
			flash[:error] = "The Username does not exists"
			redirect_to login_user_index_path
		end
		
	end
	def login  
	end
	def logout
    	session.delete :User
		redirect_to login_user_index_path
	end
end
