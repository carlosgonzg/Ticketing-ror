Feature: My Dashboard
    In order to avoid if the Admin and the IT Staff is the only one that can view the dashboard
    I want to check if the dashboard works well
    
Background: I have logged in as a different type of User

And loggingin into the system

    Scenario: Entering in Dashboard
        Given I am on the home page
        When I click on "My Dashboard"
        Then I should see the My Dashboard page
      
    Scenario: Dashboard should be available only for Admin or IT Staff
        Given I am logged in as an "Admin" 
        When I click on "Home"
        Then I should see the My Dashboard link

    Scenario: Dashboard should NOT be available only for User
        Given I am logged in as an "User" 
        When I click on "Home"
        Then I should NOT see the My Dashboard link