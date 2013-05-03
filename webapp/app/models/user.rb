class User < ActiveRecord::Base
  attr_accessible :UserType,:Fullname,:Username,:password_digest,:email
<<<<<<< HEAD
  has_secure_password
=======
    #has_secure_password
>>>>>>> 67d0495f3286969f6a204f6342c3ca095a675cec
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
