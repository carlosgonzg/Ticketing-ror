
Feature: login request

Authorizing user who login into the system

Background: user table is created with entries

Given the following users have been added to User:
  | UserType | Fullname 	| Username   | password_digest | email                          |
  | 0        | Michael Carter   | mlcarter   | mlcarter        | mlcarter815@gmail.com          |
  | 0	     | Meenal Khandelwal| mkhandelwal| mkhandelwal     | meenal.khandelwal616@gmail.com |

Scenario: logging in into the system
  Given I am on the home page 
  When I entered username "mkhandelwal" and password "mkhandelwal"
  Then I should see the user page

Scenario: logging in into the system
  Given I am on the home page 
  When I entered username "mkhandelwal" and password "kill"
  Then I should see wrong password


Scenario: logging in into the system
  Given I am on the home page 
  When I entered username "mk" and password "mkhandelwal"
  Then I should not see the home page

Scenario: logging in into the system
  Given I am on the home page 
  When I entered username "mk" and password "kill"
  Then I should not see the home page
