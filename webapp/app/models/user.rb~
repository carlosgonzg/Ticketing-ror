class User < ActiveRecord::Base
  attr_accessible :UserType,:Fullname,:Username,:password_digest,:email
  has_secure_password
  def self.authenticate(username,password)
    userDB = User.count(:conditions => "Username = '#{username}'")
	if userDB > 0 then
  		passDB = User.count(:conditions => "Username = '#{username}' AND password_digest = '#{password}'")
		if passDB > 0 then
			return 0
		else
			return -1
		end
	else
		return -2
	end
  end
end
