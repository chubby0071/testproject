@signin_page

Feature: Signin to Nexia Diagnostics

@login_PageValidation
Scenario: Validation of Nexia Diagnostics Signin page
Given I am on the 'sign in' page 
Then I am able to verify detail of element in 'sign in' Page


@login_InvalidAttempt
Scenario Outline: Enter invalid username and password
Given I am on the 'sign in' page
When I enter the login username <username>
And I enter the login password <password>
And I click the 'Login' button
Then an error-box is displayed: "Invalid credentials"

Examples: Invalid combinations
| username       | password       |
| ""             | ""             |
| "notausername" | "notapassword" |
| "" | "nouser" |
| "nopass" | "" |
| "$#$%^" | "%%$$" |
| "1234" | "3456" |
| "%$^" | "1234" |
| "987" | "@@#$" |
| "dso" | "13ebus" |
| "dsa" | "13ebusiness" |


@login_ValidAttempts
Scenario Outline: Enter valid username and password
Given I am on the 'sign in' page
When I enter the login username <username>
And I enter the login password <password>
And I click the 'Login' button
Then I am directed to the 'customer listing' page
Then I am logged out after 'Logout'
# https://qa-diagnostics.mynexia.com/customers#page-1

Examples: Valid combinations
| username       | password       | 
| "dso"          | "13ebusiness"  | 
| "DSO"          | "13EBUSINESS"  | 
# usename and password are not case sensitive



