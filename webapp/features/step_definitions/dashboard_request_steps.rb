Then(/^I should see the My Dashboard page$/) do
    current_path.should == '/request/dashboard'
end

Given(/^I am logged in as an "(.*?)"$/) do |arg1|
    visit("/user/logout")
    if arg1 == "Admin" then
        @user = User.find(:all, :conditions=>"Username = 'cagonzalez'")
        visit("/user/login")
        fill_in("Username", :with => @user[0].Username)
        fill_in("Password", :with => @user[0].password_digest)
        click_button("Sign In")
    elsif arg1 == "User" then
        @user = User.find(:all, :conditions=>"Username = 'test'")
        visit("/user/login")
        fill_in("Username", :with => @user[0].Username)
        fill_in("Password", :with => @user[0].password_digest)
        click_button("Sign In")
    end
end

Then(/^I should see the My Dashboard link$/) do
   reg = /<a href="\/request\/dashboard">My Dashboard<\/a>/i
   if page.body.scan(reg).blank? then
       assert false
   else
       assert true
   end
end

Then(/^I should NOT see the My Dashboard link$/) do
    reg = /<a href="\/request\/dashboard">My Dashboard<\/a>/i
    if page.body.scan(reg).blank? then
        assert true
        else
        assert false
    end
end