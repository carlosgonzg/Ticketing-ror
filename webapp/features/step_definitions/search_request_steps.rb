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

