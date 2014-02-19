Feature: This testcase uses for Verifing the UI for Search page
Scenario: Verify that the UI emement displays properly

	#RECOVERY 
	Given Open the HGWM search page page
	#CHECK UI
 	When I search for Starbucks Coffee in Johoh at Johor Bahru
 	Then The restaurant information should be displayed properly
 	Then I should see RELEVANCE button
 	Then I should see POPULAR button
 	Then I should see DISTANCE button
 	When I search for Tea Lounge restaurant in Klang Valley at Kuala Lumpur 
 	Then I should see the number of result return
 	When I visit the Tea Lounge page
 	Then The Tea Lounge page should open successful
	When I search for Pizza Hut in Melaka
 	Then The number of result should be displayed
 	When I search for Restoran Malaysia Raya at Ipoh
 	Then The number of result should be return
 	Then The Restoran Malaysia Raya restaurant should display in search result
 	And I login HGWM page to check the search function
 	When I search for nothing at Penang
 	Then the search result should be return successful
 	Then I should see the Pagination
 	And I click SUBMIT REVIEW button
 	Then The SUBMIT REVIEW section should be displayed
 	And I click HUNGRY GO WHERE logo
 	Then The browser should be navigated to HomePage