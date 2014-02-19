Feature: This feature for test the Edit profile information 
Background: 
	Given Open the edit profile page 
Scenario: Verify the UI for Edit Profile
 	Then I should see the Photo label
 	Then I should see the Change Photo button
 	Then I should see the Display Name label
 	Then I should see the Display Name textbox
	Then I should see the First Name label
	Then I should see the First Name textbox
	Then I should see the Last Name label
	Then I should see the Last Name textbox
	Then I should see the genders label
	Then I should see the gengers option box
	Then I should see the Date Of Birth label
	Then I should see the Date of Birth calendar
	Then I should see the Age Group label
	Then I should see the Age Group select box
	Then I should see the Occupation label
	Then I should see the Occupation select box
	Then I should see the Monthly Income label
	Then I should see the Monthly Income select box
	Then I should see the State label
	Then I should see the State select box
	Then I should see the website label
	Then I should see the website text box
	Then I should see the Description label
	Then I should see the Description text box
	Then I should see the Save Changes button
	Then I should see the Cancel button


Scenario: Verify that user can edit profile image successful
	When I upload a new photo image 
	Then The image should be change successful 

Scenario: Verify that the Display Name cannot empty 
	When The Display name field is empty 
	Then The error message for Display Name field display

Scenario: Verify that the Fist Name - Last Name - Display Name are changed successfully 
	When I change the First Name - Last Name and Display Name 
	Then The profile names change successful 

Scenario: Verify that the Date of Birth change successful 
	When I change the Date of Birth 
	Then The date of birth should change successful  

Scenario: Verify that the Age Group - Occupation - Monthly Income and State change successful 
	When User change Age Group - Occupation - Monthly Income and State 
	Then The Age Group - Occupation - Monthly Income and State should change successful 

Scenario: Verify that user can change the website field and describe field 
	When I input an invalid website format 
	Then The error message of invalid website format should display
	When I input a valid website format 
	Then The website should save successful 
Scenario: Verify that user can update the user describer
	When I update the describle 
	Then the describe should save successful 
