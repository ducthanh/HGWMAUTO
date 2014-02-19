require 'action.rb'

#variable 
rest_name = "2359Rest Test"
state = 'Ipoh'
must_try = ["Caramel Macchiato"]
image_path = [Dir.getwd + "/features/upload-files/image.jpg"]
suitable_for_list = ["Dinner"]
review_content = "This is an full reveiew"
atmosphere_list = ["Cozy", "Zen"]
error_msg_restaurant = "Please enter a valid restaurant"
error_msg_vote = "Please vote for the restaurant."
error_msg_price = "Please select a price range"
error_msg_rate = "Please rate."
error_msg_yr_review = "Please input the content of the review"
error_msg_suitable = "Please select a tag under \"Suitable For\""
error_msg_atmosphere = "Please select a tag under \"Atmosphere\""
price = 2
rating = [3,3,5,5]

#Page Object 
ADD_QUICK_REIVEW_BUTTON = '.col-review a'
GO_TO_FULL_REVIEW = '.fr-next'
review = Action.new()

Given(/^Login the HGWM page to add a full review$/) do
  
  login('2359testvn@gmail.com','123456')
  set_window_size(1350,1350) 
  # find(ADD_QUICK_REIVEW_BUTTON).click
  # find(GO_TO_FULL_REVIEW).click 
  #a.add_full_review(must_try, 'up', 2, true, image_path, suitable_for_list, review_content, atmosphere_list) 
end

Given(/^I open the Add Full Review page$/) do
  review.search_rest_open(rest_name, state)
  find("a", :text => "ADD FULL REVIEW").click
end

Then(/^I should see the Restaurant label$/) do
  page.should have_content("Name of Restaurant*:") 
end

Then(/^I should see the Restaurant field$/) do
  page.should have_css('input[name=restName]')
end

Then(/^I should see the Address label$/) do
  page.should have_content("Address")
end

Then(/^TC_013 I should see the Address field$/) do
  page.should have_css('.address-textarea')
end

Then(/^TC_013 I should see the Must \- Try label$/) do
  page.should have_content("Must - Try:") 
end

Then(/^I should see the Must \- Try field$/) do
  page.should have_css('.rating-panel-wrapper .must-try-qr input') 
end

Then(/^TC_013 I should see the Recommendation label$/) do
  page.should have_content("Recommendation*:") 
end

Then(/^I should see the Vote buttons$/) do
  page.should have_css('.vote-panel .vote-up')
  page.should have_css('.vote-panel .vote-down')
end

Then(/^TC_013 I should see the Price label$/) do
  page.should have_content("Price*:") 
end

Then(/^I should see the Price buttons$/) do
  page.should have_css('.price-range1')
  page.should have_css('.price-range2')
  page.should have_css('.price-range3')
  page.should have_css('.price-range4')
  page.should have_css('.price-range5')
end

Then(/^I should see the Rating label$/) do
  page.should have_content("Ratings*:") 
end

Then(/^I should see the rating forms$/) do
  page.should have_content("Food / Drink") 
  page.should have_content("Value")
  page.should have_content("Service")
  page.should have_content("Ambiance")
end

Then(/^I should see the Photos of Restaurant label$/) do
  page.should have_content("Photos of Restaurant:") 
end

Then(/^I should see the Your Review label$/) do
  page.should have_content("Your Review*:") 
end

Then(/^Then I should see the Your Review text box$/) do
  page.should have_css(".content-textarea") 
end

Then(/^I should see the Suitable For label$/) do
  page.should have_content("Suitable For*") 
end

Then(/^I should see the Atmosphere label$/) do
  page.should have_content("Atmosphere*")
end

When(/^I add a full review without the restaurant name$/) do
  review.qrv_gofullrv
  find('.grey-btn').click
end

Then(/^I should see the error message for mising the Restaurant name$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_restaurant
  page.driver.browser.switch_to.alert.accept
end

When(/^I add a full review without the Recommendation$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, nil, price, rating, image_path, suitable_for_list, review_content, atmosphere_list)
end

Then(/^I should see the error message for missing the Recommendation$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_vote
  page.driver.browser.switch_to.alert.accept # express the regexp above with the code you wish you had
end

When(/^I add a full review without the Price$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', nil, rating, image_path, suitable_for_list, review_content, atmosphere_list)
end

Then(/^I should see the error message for missing the Price$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_price
  page.driver.browser.switch_to.alert.accept
end

When(/^I add a full review without the Ratings$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', price, nil, image_path, suitable_for_list, review_content, atmosphere_list)
end

Then(/^I should see the error message for missing the Ratings$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_rate
  page.driver.browser.switch_to.alert.accept # express the regexp above with the code you wish you had
end

When(/^I add a full review without the Suitable For$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', price, rating, image_path, nil, review_content, atmosphere_list) # express the regexp above with the code you wish you had
end

Then(/^I should see the error message for missing the Suitable For$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_suitable
  page.driver.browser.switch_to.alert.accept
end

When(/^I add a full review without the add Review content$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', price, rating, image_path, suitable_for_list, nil, atmosphere_list)
end

Then(/^I should see the error message for missing the Review content$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_yr_review
  page.driver.browser.switch_to.alert.accept
end

When(/^I add a full review without the add Atmosphere$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', price, rating, image_path, suitable_for_list, review_content, nil)
end

Then(/^I should see the error message for missing the Atmosphere$/) do
  page.driver.browser.switch_to.alert.text.should eq error_msg_atmosphere
  page.driver.browser.switch_to.alert.accept
end

When(/^I add a full restaurant review$/) do
  review.search_rest_open(rest_name,state)
  review.add_full_review(must_try, 'up', price, rating, image_path, suitable_for_list, review_content, atmosphere_list)
end

Then(/^The review should be added successfully$/) do
  page.title.should match(rest_name) 
end