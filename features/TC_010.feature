Feature: This feature is using for checking the UI of user profile 
Background: 
	Given I open the user profile
Scenario: Verify that user can open the Submit review section
	When I click Submit review button 
	Then The Submit review section should be display
Scenario: Verify the labels and links display properly 
	Then I should see the display name
	Then I should see the user's avatar
	Then I should see the user's level
	Then I should see the point to level up 
	Then I should see the description 
	Then I should see the Edit button
	Then I should see the Points button
	Then I should see the Activities button
	Then I should see the recommends tab
	Then I should see the wants tab
	Then I should see the tried tab
	Then I should see the photos tab
	Then I should see the reviews tab
	Then I should see the badges tab
	Then I should see the following tab
	Then I should see the followers tab

Scenario: Verify that the footer display properly 
	Given I expand the footer 
	Then The footer should be appeared properly 
	When I click HGWM logo 
	Then The home page should be opened