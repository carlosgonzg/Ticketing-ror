class UserController < ApplicationController
    skip_before_filter :require_login
	

	def edit
        @u = User.find_by_id(session[:User][:id])
    end

	def update
          @bool = true
	  @u = User.find_by_id(session[:User][:id])
	  if(!params[:fullname].blank?)
            @u.Fullname = params[:fullname]
            @u.save
	  end
	  if(!params[:emailid].blank?)
            @u.email = params[:emailid]
            @u.save
	  end
	  if(!params[:OldPassword].blank?)
	    if(params[:OldPassword] == @u.password_digest)
		    if(!params[:NewPassword].blank? && !params[:New1Password].blank?)             
		      if(params[:NewPassword]==params[:New1Password])
		        @u.password_digest = params[:NewPassword]
		        @u.save
		      else
		        flash[:error] = "Both New Password does not matches"
                        @bool = false
		      end
		    else
		      flash[:error] = "New Password are not entered"
                      @bool = false
		    end
	    else
		flash[:error] = "You have entered wrong password"
		@bool = false
            end
          end
	  if(@bool)
          	redirect_to new_request_path
	  else
		redirect_to edit_user_path
          end
    	end

        def index
	end

	def show
	 @user = User.find(session[:User][:id])  
    end
    
	def create

	end
    
    def authenticate
        answer = User.authenticate(params[:Username],params[:Password])
		if answer == 0 then
            users = User.find(:all,:conditions=>"Username = '#{params[:Username]}'")
            user_hash = {:Username => users[0].Username,:email => users[0].email,:Fullname => users[0].Fullname,:UserType => users[0].UserType,:id=>users[0].id}
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
