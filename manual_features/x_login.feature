@login
Feature: Login functionality
    
  Scenario Outline: Enter invalid username and password
    Given I am on the 'login' page
    When I enter the username <username>
    And I enter the password <password>
    And I click the "Login" button
    Then an error-box is displayed: "Invalid credentials"

    Examples: Invalid combinations
      | username       | password       |
      | ""             | ""             |
      | "notausername" | "notapassword" |
      
  Scenario Outline: Enter valid username and password
    Given I am on the 'login' page
    When I enter the username <username>
    And I enter the password <password>
    And I click the "Login" button
    Then I am redirected to the customer listing page
    # https://qa-diagnostics.mynexia.com/customers#page-1

    Examples: Valid combinations
      | username       | password       | 
      | "dso"          | "13ebusiness"  | 
      # | "DSO"          | "13EBUSINESS"  | 
      # usename and password are not case sensitive

  Scenario: Logout
    Given I am signed in
    When I click the "LOGOUT" 
    Then I am redirected to the 'login' page
