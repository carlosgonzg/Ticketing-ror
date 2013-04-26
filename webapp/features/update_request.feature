Feature: update request

I want to submit an update to the request. 
The update should be presented in the updates section.

Background: request have been added to Request

Given the following request have been added to Request:
  |ComputerName | Subject | urgent |
  | Aladdin     | hi      | yes    |
  | The         | no      | no     |
  | When	| be      | yes    |

Scenario: search result in the table
  Given I am on the search page
  When I click on "Search Request"
  Then By default I should see all the request

Scenario: select the request to be updated
  Given I am on the search page
  When I click on ID "1"
  Then I should see the Update Request form of ID "1"
  
Scenario: fill in update text and click submit
  Given I am on the Update Request page of ID "1"
  When I fill in the "update" text box
  When I click on the Submit button
  Then I should see the Search Request Form
  
Scenario: find previously updated request
  Given I am on the search page
  When I click on "Search Request"
  Then By default I should see all the request
  
Scenario: check the update was successful
  Given I am on the search page
  When I click on ID "1"
  Then I should see the Update Request form
  And the updates section should have updates