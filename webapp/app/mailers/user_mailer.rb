class UserMailer < ActionMailer::Base
  default :from => "notifications@team6.com"
  def new_request(user, request)
    @user = user
    @request = request
	mail(:to=>user.email,:subject=> "#{request.Subject}")
  end
end
