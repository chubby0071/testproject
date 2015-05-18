Feature: Add Employee functionality

  Background:
    Given I am signed in
    And I click "NOTIFICATIONS"
    And I am redirected to the "EMPLOYEE" page #employees#page-1


  Scenario: Add Emeployee page w/ no employees
    And I have not added any employees
    Then the page displays the following
       """
       NO EMPLOYEES
       CLICK "ADD EMPLOYEE" TO ADD YOUR FIRST EMPLOYEE.
       """

  Scenario: Expected elements are displayed
    Give I click the "ADD EMPLOYEE" link
    Then I am redirected to the "ADD EMPLOYEE" page #employees/new
    And a "ADD EMPLOYEE" primary header is displayed
    And a "EMPLOYEE INFO" seondary header is displayed
    And the label "Name*" followed by the name text entry box is displayed
    And the label "Email *" followed by the email text entry box is dispalyed
    And a "NOTIFY EMPLOYEE OF" seondary header is displayed
    And the "Major Alerts" check box is displayed
    And the "Critical Alerts" check box is displayed
    And a <field> <field type> field is displayed
    And the "SAVE" button is displayed
    And a "Cancel" button is displayed


  Scenario: Add Employee and I cancel
    When I click the "Add Employee" link
    And I click the "Cancel" button
    Then I'm returned to the "EMPLOYEE" page #employees#page-1
    

  Scenario: Add Employee and I save without entering data
    When I click the "Add Employee" link
    And I enter a "Name" of ""
    And I enter a "Email" of ""
    When I click "SAVE"
    Then I am prompted that "name is required"
    And I am prompted that "email is required"


  Scenario Outline: Entering invalid "Email" address
    And I enter a "Name *" of "Bob Smith"
    And I enter a "Email" of <email>
    When I click "SAVE"
    Then I am prompted to "Please enter a valid email"
    And the "Email" field is not cleared and contains <email>
    And the "Name" field is not cleared

    Examples:
      | email       |
      | asdf        |
      | asdf@       |
      | asdf@asdf   |
      | asfd@asdf.a |


  Scenario Outline: Creating a new employee
     And I enter a "Name" of <first name>
     And I enter a "Email" of <email>
     And I <select> the "Major Alerts" check box
     And I <select> the "Critical Alerts" check box     
     And the "SAVE" button is displayed
     Then the data is saved
     And I am redirected to the customer page / device details page
     And the "Name" column displays <name>
     And the "Email" column displays <email>
     And the "Selected Alerts" column displays <selected alerts>

    Examples:
      | name        | email          | major alerts | critical alerts | selected alerts   |
      | Bob Smith   | asdf@asdf.com  | don't select | don't select    | "None"            |
      | Bob Smith   | asdf@asdf.com  | select       | don't select    | "Major"           |
      | Bob Smith   | asdf@asdf.com  | don't select | select          | "Critical"        |                                        
      | Bob Smith   | asdf@asdf.com  | select       | select          | "Major, Critical" |                                                      

      *****
      and examples to show long names getting truncated with an ellipsis (ie ...)
      
      
