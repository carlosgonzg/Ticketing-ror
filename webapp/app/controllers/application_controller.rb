class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
end

private
def require_login
   unless !session[:User].blank?
       session[:return_to] = request.fullpath
   	   redirect_to login_user_index_path
   end
end
