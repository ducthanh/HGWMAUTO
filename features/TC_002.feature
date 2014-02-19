Feature: This testcase is designed to make sure that the Subcribe function works properly 
Scenario: TC_002 Verify that the Subcribe function works properly 
	Given TC_002 Open the HGWM page
	And I scroll page to the bottom 
	Then The footer should be displayed 
	And I expand the Footer 
	#Check Footer UI
	Then I should see the intro content
	Then I should see Facebook Like message
	Then I should see Twitter Follow button 
	Then I should see About Us link
	Then I should see Contact Us link
	Then I should see Terms & Conditions link 
	Then I should see Email text field 
	Then I should see FirstName textfield
	Then I should see LastName textfield
	Then I should see the Subcribe button
	#Check Subcribe function 
	And I reduce the footer 
	Then The footer should be reduced
	And I input the Subscribe information with an invalid email address
	And I click Subcribe button
	Then The error message for Invalid email address should be displayed 
	And I input the Subcribe information without FirstName
	And I click Subcribe button
	Then The error message for missing Firstname should be displayed
	And I input the Subcribe information without Lastname
	And I click Subcribe button 
	Then The error message for missing Lastname should be displayed 
	And I input a valid Subcrible information 
	And I click Subcribe button
	Then I should Subcribe successful 

