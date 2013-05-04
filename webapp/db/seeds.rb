# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

requests=[{:ComputerName => 'meenal tablet', :Subject => 'not working', :urgent => 'true', :owner => 'mlcarter'},
{:ComputerName => 'micheals computer', :Subject => 'word not working', :urgent => 'false', :owner => 'mlcarter'},
  	 ]
user1 = {:UserType => 0, :Fullname => "Michael Carter", :Username => "mlcarter",:password_digest => "mlcarter",:email => "mlcarter815@gmail.com" }
user2 = {:UserType => 0, :Fullname => "Meenal Khandelwal",:Username => "mkhandelwal",:password_digest => "mkhandelwal",:email => "meenal.khandelwal616@gmail.com" }
user3 = {:UserType => 0, :Fullname => "Carlos Gonzalez", :Username => "cagonzalez",:password_digest => "cagonzalez",:email => "carltronik@gmail.com" }
user4 = {:UserType => 0, :Fullname => "Harpreet Singh", :Username => "hsingh",:password_digest => "hsingh",:email => "harpreet-singh-1@uiowa.edu" }

requests.each do |request|
  Request.create!(request)
end
User.create!(user1)
User.create!(user2)
User.create!(user3)
User.create!(user4)
