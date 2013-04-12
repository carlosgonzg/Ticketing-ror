Feature: New Request
    In order to avoid creating bad requests
    I want to create or insert new request with good validation
    
Background: request have been added to Request

Given the following request have been added to Request:
  |ComputerName | Subject | urgent |
  | Aladdin     | hi      | yes    |
  | The         | no      | no     |
  | When	| be      | yes    |

    Scenario: Entering in new request
        Given I am on the home page
        When I click on "New Request"
        Then I should see the New Request form
        
    Scenario: Checking if all the inputs are in the form
        Given I am on the home page
        When I click on "New Request"
        Then I should see these inputs: "Name, Room #, Employee ID, Urgent, Phone #, Summary, Description, Submit" in these types of field: "Text, Text, Text, Checkbox, Text, Text, Text, Button"
   
    Scenario: Checking if validation works
        Given I am on the "New Request" form
        And I inserted "wrong" data on the form
        When I click on the Submit button
        Then I should get an error
    
    Scenario: Creating a new Request
        Given I am on the "New Request" form
        And I inserted "valid" data on the form
        When I click on the Submit button
        Then I should see an message that says: "The Request was created Successfully"
        And I should get no error 
