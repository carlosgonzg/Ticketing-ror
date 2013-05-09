class UserMailer < ActionMailer::Base
  default :from => "notifications@team6.com"
  def new_request(user, request_r)
    @user = user
    @request = request_r
      email_array = [user[:email]]
      users_admin = User.find(:all,:conditions=>"UserType = 0")
      users_admin.each do |user_admin|
          email_array << user_admin.email
      end
	mail(:to=>email_array,:subject=> "#{request_r.Subject}")
  end
  def complete_request(user, request_r)
    @request = request_r
      mail(:to=>[user[:email]],:subject=> "Your request was completed")
  end
  def new_owner(user, request_r)
    @request = request_r
      mail(:to=>[user[:email]],:subject=> "You have been assigned a new request")
  end
  def create_user(user)
    @user = user
    mail(:to=>user.email,:subject=> "New User has been assigned for you!")
  end
end
