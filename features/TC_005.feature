Feature: This testcase uses for testing the Recovery password function 
Scenario: Verify that Recovery function works properly

	#RECOVERY 
	Given Open the HGWM recovery passsword

	#CHECK UI
	#Then The page's title should be displayed properly 
	Then The recovery password page should be displayed
	Then I should see Email field 
	Then I should see Submit button
	
	#Recovery function
	And I click Submit button without inputing email 
	Then I should see the error message to require email input 
	And I recover the password by inputing an invalid email address 
	Then The error message for inputing an invalid email address should be displayed 
	And I recover the password by inputing an invalid email format 
	Then The error message for inputing an invalid email format should be displayed
	And I recover the password by inputing a vaild email address
	Then I should recover password successful