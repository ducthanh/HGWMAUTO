Given(/^Open the HGWM page$/) do
  openUrl 
  set_window_size(1150, 1300)
end

Then(/^I should see SEARCH button$/) do
  page.should have_xpath("//input[contains(@class, \"btn submit-btn pull-left\")]")
end

Then(/^I should see SIGN UP \/ LOGIN button$/) do
  page.should have_content("SIGN UP / LOGIN")
end

Then(/^I should see Discovery button$/) do
  page.should have_content("Discovery")
end

Then(/^I should see the Choosen for you button$/) do
  page.should have_content("Chosen for you")
end

Then(/^I should see Social button$/) do
  page.should have_content("Social")
end
#debugger
Then(/^I should see Food Guide button$/) do
  page.should have_content("Food Guide")
end

Then(/^I should see Recipes button$/) do
  page.should have_content("Recipes")
end

Then(/^I should see Happenings button$/) do
  page.should have_content("Happenings")
end

Then(/^I should see Popular Searches field$/) do
  page.should have_content("Popular Searches")
end

Then(/^I should see Leaderboard button$/) do
  page.should have_content("Leaderboard")
end

Then(/^I click Social button$/) do
 find(:xpath, "/html/body/div/div[4]/div[2]/div[3]/a").click
end

Then(/^The Social tab should highlight$/) do
  page.should have_css('div#home-menu.is-desktop div#sort-social.sort a.is-active')
end

Then(/^I click Food Guide button$/) do
  find(:xpath, "/html/body/div/div[4]/div[2]/div[4]/a").click
end

Then(/^the Food Guild tab should be highlight$/) do
  page.should have_css('div#home-menu.is-desktop div#sort-editorials.sort a.is-active')
end

Then(/^I click Recipes button$/) do
  find(:xpath, "/html/body/div/div[4]/div[2]/div[5]/a").click
end

Then(/^the Recipes tab should be highlight$/) do
  page.should have_css('div#home-menu.is-desktop div#sort-recipes.sort a.is-active')
end

Then(/^I click Happenings button$/) do
  find(:xpath, "/html/body/div/div[4]/div[2]/div[6]/a").click
end

Then(/^the Happenings tab should be highlight$/) do
  page.should have_css('div#home-menu.is-desktop div#sort-happenings.sort a.is-active')
end

Then(/^I click SIGN UP \/ LOGIN button$/) do
  find(:xpath, "//a[contains(@data-toggle, \"modal\")]").click
end

Then(/^the login pop\-up should be displayed$/) do
  page.should have_content("Already registered? Sign in with your")
end

Then(/^I click close button$/) do
  find(:xpath, " //button[contains(@class,\"close free-body\")]  ").click
end

Then(/^the Login pop\-up should be disappeared$/) do
  page.should have_no_content("Already registered? Sign in with your")
end

#page.select 'March', :from => 'Month'
Then(/^I select Penang$/) do
  find(:css,'div.navbar div.desktop-nav-wrapper div.navbar-inner div.container ul.nav li.col div.flag-panel span.caret').click
  click_link('Penang')
end

Then(/^Penang page should be displayed$/) do
  page.should have_content("Penang")
end

Then(/^I select Johor$/) do
  find(:css,'div.navbar div.desktop-nav-wrapper div.navbar-inner div.container ul.nav li.col div.flag-panel span.caret').click
  click_link('Johor')
end

Then(/^Johor page should be displayed$/) do
  page.should have_content("Johor")
end

Then(/^I select Melaka$/) do
  find(:css,'div.navbar div.desktop-nav-wrapper div.navbar-inner div.container ul.nav li.col div.flag-panel span.caret').click
  click_link('Melaka')
end

Then(/^Melaka page should be displayed$/) do
  page.should have_content("Melaka")
end

Then(/^I select Ipoh$/) do
  find(:css,'div.navbar div.desktop-nav-wrapper div.navbar-inner div.container ul.nav li.col div.flag-panel span.caret').click
  click_link('Ipoh')
end

Then(/^Ipoh page should be displayed$/) do
  page.should have_content("Ipoh")
end

Then(/^I select Klang Valley$/) do
  find(:css,'div.navbar div.desktop-nav-wrapper div.navbar-inner div.container ul.nav li.col div.flag-panel span.caret').click
  click_link('Klang Valley')
end

Then(/^Klang Valley page should be displayed$/) do
 page.should have_content("Klang Valley")
end