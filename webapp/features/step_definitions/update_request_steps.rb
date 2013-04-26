Given /^I am on the search page$/ do
    visit 'http://0.0.0.0:3000/request/search'
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
  	fill_in(form, with: 'This is an update')
end

When /^I click on the "(.*?)" button$/ do |button|
	click_button(button)
end

And /^the updates section should have updates$/ do
    page.has_css?("div.updates li", :count => 1)
end