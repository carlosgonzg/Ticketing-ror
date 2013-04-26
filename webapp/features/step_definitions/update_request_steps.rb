Given /^I am on the search page$/ do
    visit 'http://0.0.0.0:3000/request/search'
end

Then /^I should see the New Request form$/ do
    pending # express the regexp above with the code you wish you had
end

When /^I click on ID "(.*?)"$/ do |id|
    click_link id
end

Then /^I should see the Update Request form of ID "(.*?)"$/ do |id|
	current_path.should == '/request/'+id+'/edit'
end

Given /^I am on the Update Request page of ID "(.*?)"$/ do |id|
	visit 'http://0.0.0.0:3000/request/'+id+'/edit'
end

When /^I fill in the "(.*?)" text box$/ do |form|
  	
end
