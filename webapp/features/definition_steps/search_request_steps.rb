Then /^I should see the Search Request Form$/ do
  if(find(:id, 'sR').active)
    assert true
  else
    assert false
  end
end

Then /^I should see a page with entries: "(.*?), (.*?), (.*?)"$/ do |input1, input2, input3|
    if page.respond_to? :should
         assert page.should have_css("//td[text()='#{input1}']")
   else
      assert page.has_css?("//td[text()='#{input1}']")
    end
end

Then /^By default I should see all the request$/ do
  assert page.has_css?("table tbody tr", all("table#Request tr").count)
end

