Feature: Open the Home page and check that navigation links works properly 
Scenario: TC_001 Verify that the navigation works properly 
	Given Open the HGWM page
	
	#Check UI 
	Then I should see SEARCH button 
	Then I should see SIGN UP / LOGIN button 
	Then I should see Discovery button 
	Then I should see the Choosen for you button 
	Then I should see Social button 
	Then I should see Food Guide button 
	Then I should see Recipes button 
	Then I should see Happenings button
	Then I should see Popular Searches field
	Then I should see Leaderboard button
	#Check Links
	#And I click the Chosen for you tab 
	#Then The login require pop up should be displayed
	#And I click OK button
	#Then The Login Pop up should be displayed 
	And I click Social button 
	Then The Social tab should highlight 
	And I click Food Guide button
	Then the Food Guild tab should be highlight 
	And I click Recipes button
	Then the Recipes tab should be highlight 
	And I click Happenings button
	Then the Happenings tab should be highlight 
	And I click SIGN UP / LOGIN button 
	Then the login pop-up should be displayed
	Then I click close button
	Then the Login pop-up should be disappeared 
	#Select State 
	And I select Penang
	Then Penang page should be displayed
	And I select Johor
	Then Johor page should be displayed
	And I select Melaka
	Then Melaka page should be displayed 
	And I select Ipoh
	Then Ipoh page should be displayed
	And I select Klang Valley
	Then Klang Valley page should be displayed