
Given(/^the following users have been added to User:$/) do |user_table|
  user_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^I am on the home page$/ do
  visit 'http://0.0.0.0:3000/user/login'
end
  
When /^I entered username "(.*?)" and password "(.*?)"$/ do |username, password|
  fill_in('Username', :with => username)
  fill_in('Password', :with => password)
  click_button('Sign In')
end

Then /^I should see the user page$/ do
  visit 'http://0.0.0.0:3000/request/new'
end

Then /^I should see wrong password$/ do
  assert "Incorrect Password"
end

Then /^I should not see the home page$/ do
  assert "The Username does not exists"
end
