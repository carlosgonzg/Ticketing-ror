Feature: Profile
    In order to View, Create User and Edit Profile
    I want to check if View and Edit Profile works
    
Background: I'm logged in

    Scenario: Entering in my Profile
        Given I am logged in as an "Admin" 
        When I click on "cagonzalez"
        Then I should see the My Profile page
      
    Scenario: Viewing my Profile
        Given I am logged in as an "Admin" 
        When I click on "cagonzalez"
        And I click on "View Profile"
        Then I should see My Profile

    Scenario: Editing my Profile
        Given I am logged in as an "Admin" 
        When I click on "cagonzalez"
        And I click on "Edit Profile"
        And I edit my Fullname to "test case"
        Then my Profile should be editted
        
    Scenario: Creating user should be only for Admin or IT/Staff
        Given I am logged in as an "Admin" 
        When I click on "cagonzalez"
        Then should see Create User link    

    Scenario: Creating user shouldn't be available for User
        Given I am logged in as an "User" 
        When I click on "test"
        Then shouldn't see Create User link          