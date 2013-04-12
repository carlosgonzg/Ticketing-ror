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

Scenario: Inputs on the page
  Given I am on the home page
  When I click on "Search Request"
  Then I should see a page with entries: "category", "value", "search"

Scenario: search result in the table
  Given I am on the home page
  When I click on "Search Request"
  Then By default I should see all the request

