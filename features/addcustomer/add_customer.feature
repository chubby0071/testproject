@add_customer
Feature: Add Customer functionality

Background:
Given I am logged in
And I click the "ADD CUSTOMER" button
And I am redirected to the "ADD CUSTOMER" page

@addcustomerpagevalidation
Scenario Outline: Expected elements are displayed in add customer page
Then a "ADD CUSTOMER" main header is displayed
And a "CUSTOMER INFO" secondary header is displayed
And a <field> <field type> field is displayed
And the "State" combo box is populated with all 50 US states
And the "Phone" text entry filed contains a phone number mask "(___) ___-____"
And the "SAVE" button is displayed
And a "Cancel" button is displayed

Examples:
| field          | field type |
| "First Name *" | text entry |
| "Last Name *"  | text entry |
| "Address 1"    | text entry |
| "Address 2"    | text entry |
| "City"         | text entry |
| "State"        | combo box  |
| "Zip"          | text entry |
| "Phone"        | text entry |
| "NOTES"        | text entry |


Scenario: Add Customer and I "Cancel"
When I click "Cancel"
Then I'm redirected to the customer listing page #/customers#page-1


Scenario: Add Customer and I save without entering data
And I enter a "First Name *" of ""
And I enter a "Last Name *" of ""
When I click "SAVE"
Then I am prompted that "First name is required"
And I am prompted that "Last name is required"


Scenario Outline: Entering invalid "Zip" code
And I enter a "First Name *" of "Bob"
And I enter a "Last Name *" of "Smith"
And I enter a "Zip" of <zip>
When I click "SAVE"
Then I am prompted to "Please enter a valid zip code"
And the "Zip" field is not cleared and contains <zip>

Examples:
| zip      |
| "1"      |
| "12"     |
| "123"    |
| "1234"   |
| "aaaaa"  |


Scenario Outline: Entering invalid "Phone" number
And I enter a "First Name *" of "Bob"
And I enter a "Last Name *" of "Smith"
And I enter a "Phone" of <phone>
When I click "SAVE"
Then I am prompted to "Please enter a valid phone number"
And the "Phone" field is cleared

Examples:
| phone          |
| (111) ___-____ |
| (111) 1__-____ |
| (111) 11_-____ |
| (111) 111-____ |
| (111) 111-1___ |
| (111) 111-11__ |
| (111) 111-111_ |


Scenario Outline: Entering invalid "Email" address
And I enter a "First Name *" of "Bob"
And I enter a "Last Name *" of "Smith"
And I enter a "Zip" of <email>
When I click "SAVE"
Then I am prompted to "Please enter a valid email"
And the "Email" field is not cleared and contains <email>

Examples:
| email       |
| asdf        |
| asdf@       |
| asdf@asdf   |
| asfd@asdf.a |


Scenario Outline: Creating a new cusotmer
And I enter a "First Name *" of <first name>
And I enter a "Last Name *" of <last Name>
And I enter a "Address 1" of <address 1>
And I enter a "Address 2" of <address 2>
And I enter a "City" of <city>
And I select a State of <state>
And I enter a "Zip" of <zip>
And I enter a "Phone" of <phone>
And I enter a "Phone" of <email>
And I enter a "Notes" of <notes>
And the "SAVE" button is displayed
Then the data is saved
And I am redirected to the customer listing page #/customers#page-1 
And page displays the following
"""
<first name> <last Name> - 0 SYSTEMS
<address 1>, <address 2>      <email>
<city>, <state> <zip>         <phone>
"""
And the page displays the following
"""
NO SYSTEMS
CLICK "ADD SYSTEM" TO ADD A SYSTEM TO THIS CUSTOMER.
"""

Examples:
| first name  | last Name | address 1    | address 2 | city      | state  | zip   | phone        | email          | notes          |
| M           | K         | ""           | ""        | ""        | ""     | ""    | ""           | ""             | ""             |
| M           | K         | 123 Main St. | Suite 150 | Anywhere  | CO     | 12345 | 123-123-1234 | asdf@asdf.com  | This is a note |


Scenario Outline: Delete a new cusotmer and I select "Cancel"
And I have the following customer
| first name  | last Name | address 1    | address 2 | city      | state  | zip   | phone        | email          | notes          |
| M           | K         | 123 Main St. | Suite 150 | Anywhere  | CO     | 12345 | 123-123-1234 | asdf@asdf.com  | This is a note |
And it is the only customer
And I select the customer "M K"
And I redirected to the customer page #customers/14
And I click the "Edit Customer" button
And I am redirected to the "Edit Customer" page #/customers/14/edit
When I click the "Delete" button
Then a OK Cancel message box prompts me
""""
Are you sure you want to delete this customer? This cannot be undone.
"""
And I select "Cancel"
And the customer is not deleted
And I remain on the "Edit Customer" page #/customers/14/edit
Examples:
  |  |


  Scenario Outline: Delete a new cusotmer and I select "OK"
And I have the following customer
| first name  | last Name | address 1    | address 2 | city      | state  | zip   | phone        | email          | notes          |
| M           | K         | 123 Main St. | Suite 150 | Anywhere  | CO     | 12345 | 123-123-1234 | asdf@asdf.com  | This is a note |
And it is the only customer     
And I select the customer "M K"
And I redirected to the customer page #customers/14
And I click the "Edit Customer" button
And I am redirected to the "Edit Customer" page #/customers/14/edit
When I click the "Delete" button
Then a OK Cancel message box prompts me
""""
Are you sure you want to delete this customer? This cannot be undone.
"""
And I select "OK"
And the customer is deleted
And I redirected to the customer page # customers#page-1
And the page mask states:
""""
NO CUSTOMERS
CLICK "ADD CUSTOMER" TO ADD YOUR FIRST CUSTOMER.
"""
Examples:
  |  |