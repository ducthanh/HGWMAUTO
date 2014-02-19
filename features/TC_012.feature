Feature: Verify the add quick user review function
Background: 
	Given Open add Quick Review window
Scenario: Verify the UI of Quick Review displays properly 
	Then I should see Quick Review label
	Then I should see Go To Full Review button
	Then I should see the Name Of Restaurant label 
	Then I should see Name of Restaurant field 
	Then I should see the Must - Try label 
	Then I should see Must - Try field 
	Then I should see the Address label 
	Then I should see the Address field 
	Then I should see the Recommendation label 
	Then I should see vote buttons 
	Then I should see the Price label 
	Then I should see the price's rank button 
	Then I should see Submit review button
	Then I should see the Next button
	And I click close Quick Review button
	Then The quick review window should close properly 
Scenario: Verify that user cannot add review when the Restaurant field is empty 
	When I submit a quick review without input the restaurant name 
	Then The error message for missing restaurant name should display properly 
Scenario: Verify that user cannot add review when does not vote for the restaurant 
	When I submit a quick review without input the restaurant vote 
	Then The error message for missing vote should display properly 
Scenario: Verify that user cannot add review when missing the price range 
	When I submit a quick review without input the restaurant price range
	Then The error message for missing price range should display properly
Scenario: Verify that user can add the quick review successful 
	When I submit a valid quick review
	Then The Review should submit successful
Scenario: Verify that user can continue adding quick review after finshing a quick review one
	When I add a quick review first
	And I click continue button then add new quick review
	Then The next Review should add successful
Scenario: Verify that user can switch to add Full Review function
	When I switch to add full review page
	Then Add Full review page should display properly