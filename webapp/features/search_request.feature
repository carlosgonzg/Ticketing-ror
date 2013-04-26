Feature: search request

As I want to find my results quickly
I need a search page which provides search criterias
making my search efficient

Background: request have been added to Request

Given the following request have been added to Request:
  |ComputerName | Subject | urgent |
  | Aladdin     | hi      | yes    |
  | The         | no      | no     |
  | When	| be      | yes    |

Scenario: clicked on the search window tab
  Given I am on the home page
  When I click on "Search Request"
  Then I should see the Search Request Form

Scenario: search result in the table
  Given I am on the home page
  When I click on "Search Request"
  Then By default I should see all the request

Scenario: search result using request id
  Given I am on the search page
  When I select search category as "Request id" and put the value as "1"
  Then I should only see request with "Request id" as "1" 
