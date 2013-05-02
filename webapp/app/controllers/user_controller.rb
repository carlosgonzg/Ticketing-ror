class UserController < ApplicationController
    skip_before_filter :require_login
    
	def index
	end
    
	def create
		answer = User.authenticate(params[:Username],params[:Password])
		if answer == 0 then
            users = User.find(:all,:conditions=>"Username = '#{params[:Username]}'")
            user_hash = {:Username => users[0].Username,:Fullname => users[0].Fullname,:UserType => users[0].UserType}
            session[:User] = user_hash
            if session[:return_to].blank? then
                redirect_to new_request_path
            else
                redirect_to session[:return_to]
                session.delete :return_to
            end
		elsif answer == -1
			flash[:error] = "Incorrect Password"
			redirect_to login_user_index_path
		else
			flash[:error] = "The Username does not exists"
			redirect_to login_user_index_path
		end
	end
    
	def login
        if !session[:User].blank? then
            if session[:return_to].blank? then
               redirect_to new_request_path
            else
                redirect_to session[:return_to]
            end
        end
	end
    
	def logout
    	session.delete :User
		redirect_to login_user_index_path
	end
end
