Feature: search request

As I want to find my results quickly
I need a search page which provides search criterias
making my search efficient

Background: request have been added to Request

Given the following request have been added to Request:
  |ComputerName | Subject | urgent | Status |  userName   |
  | Aladdin     | hi      | true   | open   | mkhandelwal |
  | The         | no      | false  | close  |             |
  | When	| be      | true   | open   | mkhandelwal |

And the following users have been added to User:
  | UserType | Fullname 	| Username   | password_digest | email                          |
  | 0        | Michael Carter   | mlcarter   | mlcarter        | mlcarter815@gmail.com          |
  | 0	     | Meenal Khandelwal| mkhandelwal| mkhandelwal     | meenal.khandelwal16@gmail.com  |

And loggingin into the system

Scenario: clicked on the search window tab 
  Given I am on the user page
  When I click on Search Request
  Then I should see the Search Request Form

Scenario: search result in the table
  Given I am on the user page
  When I click on Search Request
  Then By default I should see all the request

Scenario: search result using request id
  Given I am on the search page
  When I select search category as "Request id" and put the value as "1"
  Then I should only see request with "Request id" as "1" 
  But I should not see request with "Request id" as "2"

Scenario: search result using user name
  Given I am on the search page
  When I select search category as "User Name" and put the value as "mkhandelwal"
  Then I should only see request with "User Name" as "mkhandelwal" 
  But I should not see request with username as "ross"

Scenario: search result using all
  Given I am on the search page
  When I select search category as all
  Then I should see all the request

Scenario: search result using status
  Given I am on the search page
  When I select search category as "Status" and put the value as "open"
  Then I should only see request with "Status" as "open" 
  But I should not see request with status as "close"

Scenario: search result using urgent
  Given I am on the search page
  When I select search category as "Urgent" and put the value as "true"
  Then I should only see request with urgent as true 
  But I should not see request with urgent as false

Scenario: search result not found
  Given I am on the search page
  When I select search category as "Request id" and put the value as "456"
  Then I should see all the request
  And I should also see a flash notice saying request not found
