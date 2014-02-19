Feature: Verify the add full user review function works properly
Background: 
	Given Login the HGWM page to add a full review
Scenario: Verify the UI of add Full Review page display properly
	Given I open the Add Full Review page 
	Then I should see the Restaurant label
	Then I should see the Restaurant field
	Then I shoudl see the Address label
	Then TC_013 I should see the Address field
	Then TC_013 I should see the Must - Try label
	Then I should see the Must - Try field
	Then TC_013 I should see the Recommendation label
	Then I should see the Vote buttons 
	Then TC_013 I should see the Price label
	Then I should see the Price buttons
	Then I should see the Rating label
	Then I should see the Rating forms
	Then I should see the Photos of Restaurant label
	Then I should see the Your Review label 
	Then I should see the Suitable For label
	Then I should see the Your Review label
	Then I should see the Your Review text box
	Then I should see the Atmosphere label 
Scenario: Verify that user cannot add review without the Restaurant name
	When I add a full review without the restaurant name
	Then I should see the error message for mising the Restaurant name
Scenario: Verify that user cannot add review without the Recommendation
	When I add a full review without the Recommendation
	Then I should see the error message for missing the Recommendation
Scenario: Verify that user cannot add review without the Price range 
	When I add a full review without the Price 
	Then I should see the error message for missing the Price
Scenario: Verify that user cannot add review without Rating
	When I add a full review without the Ratings
	Then I should see the error message for missing the Ratings
Scenario: Verify that user cannot add the review without the Suitable For
	When I add a full review without the Suitable For 
	Then I should see the error message for missing the Suitable For
Scenario: Verify that user cannot add the review without the Review content 
	When I add a full review without the add Review content 
	Then I should see the error message for missing the Review content
Scenario: Verify that user cannot add the review without the Atmosphere
	When I add a full review without the add Atmosphere
	Then I should see the error message for missing the Atmosphere
Scenario: Verify that user can add the Full Review successful 
	When I add a full restaurant review 
	Then The review should be added successfully

