
Given /the following request have been added to Request:/ do |request_table|
  request_table.hashes.each do |request|
    Request.create!(request)
  end
end

When /^I click on "(.*?)"$/ do |page_name|
  click_link page_name
end

Then /^I should see the New Request form$/ do
    current_path.should == '/request/new'
end

Given /^I am on the "(.*?)" form$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

Given /^I inserted "(.*?)" data on the form$/ do |arg1|
    if arg1 == "wrong" then
    elsif arg1 == "valid" then
        fill_in('Subject', :with => 'Test')
        fill_in('Description', :with => 'Test Case')
    else
        assert false
    end
end

When /^I click on the Submit button$/ do
    click_button "Submit"
end

Then /^I should get an error$/ do
    reg = /<span class='label label-important message' id='warning'>Information not completed. Please complete the information<\/span>/i
    output_filtered = page.body.scan(reg)
    if output_filtered.blank? then
        assert false
        else
        assert true
    end
end

Then /^I should see an message that says: "(.*?)"$/ do |arg1|
    reg = /<span class='label label-success message' id='notice'>The Request was successfully created.<\/span>/i
    output_filtered = page.body.scan(reg)
    if output_filtered.blank? then
        assert false
        else
        assert true
    end
end

Then /^I should get no error$/ do
    reg = /<span class='label label-important message' id='warning'>Information not completed. Please complete the information<\/span>/i
    output_filtered = page.body.scan(reg)
    if output_filtered.blank? then
        assert true
        else
        assert false
    end
end
