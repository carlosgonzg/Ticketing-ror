
Given /the following request have been added to Request:/ do |request_table|
  request_table.hashes.each do |request|
    Request.create!(request)
  end
end
Given /^I am on the home page$/ do
    visit 'http://0.0.0.0:3000/request'
end

When /^I click on "(.*?)"$/ do |page_name|
  click_on page_name
end

Then /^I should see the New Request form$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I should see these inputs: "(.*?)" in these types of field: "(.*?)"$/ do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Given /^I am on the "(.*?)" form$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

Given /^I inserted "(.*?)" data on the form$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

When /^I click on the Submit button$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I should get an error$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I should see an message that says: "(.*?)"$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then /^I should get no error$/ do
    pending # express the regexp above with the code you wish you had
end
