Feature: This testcase uses for testing the Registration 
Scenario: Verify that Registration works properly 
	Given TC_003 Open the HGWM page

	#Check UI 
	And I open the Registration pop up
	Then The registration pop up should be displayed
	And I close the Registration pop up
	Then the registration pop up should be disappeared
	And I open the Registration pop up again
	Then I should see the Display Name field
	Then I should see the Email field
	Then I should see the Password field
	Then I should see the Confirm password field
	Then I should see the term of service link
	Then I should see the agree check box

	# Check Reg function 
	And I submit the Registration without input Display Name
	Then The error message for missing of Display Name should be displayed
	And I submit the Registration without Email
	Then The error message for missing Email should be displayed
	And I submit the Registration without Password
	Then The error message for missing Password field should be displayed
	And I submit the Registration without the Confirm password
	Then the error message for missging Confirm password should be displayed
	And I submit the Registration that the Confirm password missmatch the password
	Then The error message for password missmatch should be displayed
	And I submit the Registration without agree Team of Service
	Then The error message for missing the agreeability should be displayed
	And I submit the Registration with an invalid email address
	Then The error message for invalid email register should be displayed
	And I submit the Registration with an email that is already existed
	Then The error message for the email already existed should be displayed
	And I submit the vailid Registration information
	Then The new account should be created