Feature: This testcase uses for Verifing the UI for Search page

Scenario: Verify that the UI emement displays properly
	Given Open the HGWM to check the searching dish feature
	#CHECK UI
 	When I search for a dish at Klang Valley
 	Then Klang Valley I should see the message return properly
 	Then Klang Valley the dish name return should match with search term
 	Then The information of dish should be display properly when hovering

Scenario: Verify that user can search for dish in Penang 
 	Given I search for dish in Penang at George Town
 	Then I should see the message result at Penang
 	Then Penang the dish name return should match with search term
 	Then Penang the information of dish should be display properly when hovering

Scenario: Verify that user can search for dish in Johor 
 	Given I search for dish in Johor
 	Then Johor I should see the result message
 	Then Johor the dish name should match with search term
 	Then Johor the information of dish should be display properly when hovering

Scenario: Verify that user can search for dish in Melaka 
 	Given I search for dish in Mekala at Taman Malim Jaya
 	Then Malacca I should see the result message
 	Then Malaka the dish name return should match with search term
 	Then Malaka the information of dish should be display properly when hovering

Scenario: Verify that user can search for dish in Ipoh  
 	Given I login to check dish search function
 	When I search for dish in Ipoh 
 	Then Ipoh I should see the result message
 	Then Ipoh the search result should return properly

Scenario: Verify that there are no search result return when inputting invaild dish name
	Given I search for invalid dishname
	Then There are no result return