Feature: This testcase uses for testing the Registration 

Background: Make sure that user already logged in to facebook

Given TC_004 Visit Facebook page then login

Scenario: Verify that Login function works properly
	And I visit the HGWM page
	And I open login page

	# Check UI 
	Then I should see the Email login field
	Then I should see the Password filed
	Then I should see the Login button
	Then I should see the Forgot password link
	Then I should see the Remember check box

	#Login by Facebook function
	And I click the Login by Facebook button
	Then I should login successful

	#Login by email function 
	And I login in by and invalid email account
	Then I can not login, the error message for invalid email address should be displayed

	And I login in by and valid email but wrong password
	Then I can not login, the error message for invalid email or password should be displayed

	And I login with an account which did not active yet
	Then The error message for email did not active yet should be displayed

	And I login with a valid account with email and password
	Then I should login successfully 

	#LOG OUT 

	And I logout the account 
	Then I should log out successful 

