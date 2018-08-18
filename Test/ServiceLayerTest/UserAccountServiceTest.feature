Feature: AddNewUser_Specflow
	In order to Add new User
	As a math idiot
	I want to be told the sum of two numbers

@mytag
Scenario: Add New User To Application
	Given the User Account Data Model
	And the Database Data Model
	When I press add
	Then Add user to database and the result return value should be Zero
