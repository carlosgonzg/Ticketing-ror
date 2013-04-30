
Given /^I am on the user page$/ do
  visit 'http://0.0.0.0:3000/request/new'
end

When /^I click on Search Request$/ do
  within "nav nav-tabs" do

  end   
end

Then /^I should see the Search Request Form$/ do
  visit 'http://0.0.0.0:3000/request/search'
end

Then /^By default I should see all the request$/ do
  assert page.has_css?("table tbody tr", all("table#Request tr").count)
end

When /^I select search category as "(.*?)" and put the value as "(.*?)"$/ do |category, value|
   within_fieldset('details') do
    find('tr', category, :from => 'SelectCategory')
    fill_in('val', :with => value)
   end
end

Then /^I should only see request with "(.*?)" as "(.*?)"$/ do |category, value|
  assert page.has_xpath?("/table/tr/td[(count(../../tr/th[.= '#{category}']/preceding-sibling::*)+1)]
                               [.= '#{value}']")
end
