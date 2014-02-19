Var008 = {
  email: '2359testvn@gmail.com',
  password: '123456',
  display_name: 'Steve NguyenT', 
  homepage_title: "Malaysia Food Guide, Restaurant Reviews and Rating - HungryGoWhere Malaysia"
}

Given(/^I open the user profile$/) do
  openUserProfile
end

When(/^I click Submit review button$/) do
  find(:css, '.navbar-inner .container .nav .col-d .col .submit-review-toggle').click
end

Then(/^The Submit review section should be display$/) do
  page.should have_content("QUICK REVIEW")
  find(:css, '.navbar-inner .container .nav .col-d .col .submit-review-toggle').click
end

Then(/^I should see the display name$/) do
  find('.user-fullname').text.should eq Var008[:display_name]
end

Then(/^I should see the user's avatar$/) do
  page.should have_css('.profile-section .img-circle')
end

Then(/^I should see the user's level$/) do
  find('.current-level').text.should match('Level')
end

Then(/^I should see the point to level up$/) do
  find('.point-to-go').text.should match('pts to level up')
end

Then(/^I should see the description$/) do
  page.should have_css('.user-info .quote')
end

Then(/^I should see the Edit button$/) do
  page.should have_css('.btn-edit')
end

Then(/^I should see the Points button$/) do
  find('.tab-wrapper .stats').text.should eq "Points"
end

Then(/^I should see the Activities button$/) do
  find('.tab-wrapper .tab:nth-child(2)').text.should eq "Activities"
end

Then(/^I should see the recommends tab$/) do
  click_link('recommends')# express the regexp above with the code you wish you had
end

Then(/^I should see the wants tab$/) do
  click_link('wants')
end

Then(/^I should see the tried tab$/) do
  click_link('tried') # express the regexp above with the code you wish you had
end

Then(/^I should see the photos tab$/) do
  click_link('photos') # express the regexp above with the code you wish you had
end

Then(/^I should see the reviews tab$/) do
  click_link('reviews') # express the regexp above with the code you wish you had
end

Then(/^I should see the badges tab$/) do
  click_link('badges') # express the regexp above with the code you wish you had
end

Then(/^I should see the following tab$/) do
  click_link('following') # express the regexp above with the code you wish you had
end

Then(/^I should see the followers tab$/) do
  click_link('followers') # express the regexp above with the code you wish you had
end

Given(/^I expand the footer$/) do
  page.execute_script "window.scrollBy(0,240)"
  find(:css, 'div.footerindex').click
end

Then(/^The footer should be appeared properly$/) do

  page.should have_content(Var[:hgwm_intro])
end

When(/^I click HGWM logo$/) do
  page.execute_script "window.scrollBy(0,-240)"
  find(:css, '.nav .logo1').click
end

Then(/^The home page should be opened$/) do
  page.title.should == Var008[:homepage_title]
end
