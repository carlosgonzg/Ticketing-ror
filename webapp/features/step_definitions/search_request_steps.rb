Then /^I should see the Search Request Form$/ do
  if page.respond_to? :should
    assert page.should have_content('Search category')
  else
    assert page.has_content?('Search category')
  end
end

Then /^By default I should see all the request$/ do
  assert page.has_css?("table tbody tr", all("table#Request tr").count)
end

When /^I select search category as "(.*?)" and put the value as "(.*?)"$/ do |category, value|
  select(category, :from => 'SelectCategory')
  fill_in('val', :with => value)
end

Then /^I should only see request with "(.*?)" as "(.*?)"$/ do |category, value|
  assert page.has_xpath?("/table/tr/td[(count(../../tr/th[.= '#{category}']/preceding-sibling::*)+1)]
                               [.= '#{value}']")
end
