Feature: update request

I want to submit an update to the request. 
The update should be presented in the updates section.

Background: request have been added to Request

Given the following request have been added to Request:
  |ComputerName | Subject | urgent | complete |  userName   |
  | Aladdin     | hi      | true   | true     | mkhandelwal |
  | The         | no      | false  | false    |  mlcarter   |
  | When	| be      | true   | true     | mkhandelwal |

And the following users have been added to User:
  | UserType | Fullname 	| Username   | password_digest | email                          |
  | 0        | Michael Carter   | mlcarter   | mlcarter        | mlcarter815@gmail.com          |
  | 0	     | Meenal Khandelwal| mkhandelwal| mkhandelwal     | meenal.khandelwal16@gmail.com  |

And loggingin into the system

Scenario: search result in the table
  Given I am on the search page
  When I click on Search Request
  Then By default I should see all the request

Scenario: select the request to be updated
  Given I am on the search page
  When I click on ID "2"
  Then I should see the Update Request form of ID "2"
  
Scenario: fill in update text and click submit
  Given I am on the Update Request page of ID "2"
  When I fill in the "UpdateText" text box
  When I click on the "Submit" button
  Then I should see the Search Request Form
  
Scenario: find previously updated request
  Given I am on the search page
  When I click on Search Request
  Then By default I should see all the request
  
Scenario: check the update was successful
  Given I am on the search page
  When I click on ID "1"
  Given I am on the Update Request page of ID "2"
  And the updates section should have updates