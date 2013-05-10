Then(/^I should see the My Profile page$/) do
    current_path.should == '/user/3'
end

Then(/^I should see My Profile$/) do
    reg = /Carlos Gonzalez/
    if page.body.scan(reg).blank? then
        assert false
    else
        assert true
    end
end

When(/^I edit my Fullname to "(.*?)"$/) do |arg1|
    fill_in('FullName',:with=>arg1)
    click_button "Save Changes"
end

Then(/^my Profile should be editted$/) do
    click_link "cagonzalez"
    reg = /test case/
    if page.body.scan(reg).blank? then
        assert false
        else
        assert true
    end
end

Then(/^should see Create User link$/) do
    reg = /<a href="\/user\/new">Create User<\/a>/
    if page.body.scan(reg).blank? then
        assert false
    else
        assert true
    end
end

Then(/^shouldn't see Create User link$/) do
     reg = /<a href="\/user\/new">Create User<\/a>/
     if page.body.scan(reg).blank? then
        assert true
     else
        assert false
     end
     end