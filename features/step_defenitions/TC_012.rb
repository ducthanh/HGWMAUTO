Var0012 = {rest_name: rand(36**11).to_s(36), 
  must_try1: 'Americano',
  must_try2: "Cappuccino",
  must_try3: "Caramel Macchiato",
  qreview_tkmsg: "Thanks for your submission. We will be reviewing it.", 
  rest_address: "123 Test stress, MY", 
  alert_msg_rname: "Missing restaurant name",
  alert_msg_vote: "Please vote first.",
  alert_msg_price: "Please select a price range.", 
  full_review_text: "Photos of Restaurant:"
}
must_try = ["Americano", "Cappuccino", "Caramel Macchiato"]


Given(/^Open add Quick Review window$/) do
  login('2359testvn@gmail.com','123456') 
  set_window_size(1350,1350)
  find('.col-review a').click
end

Then(/^I should see Quick Review label$/) do
  page.should have_content("QUICK REVIEW") # express the regexp above with the code you wish you had
end

Then(/^I should see Go To Full Review button$/) do
  page.should have_css('.pull-left .grey-btn')
end

Then(/^I should see the Name Of Restaurant label$/) do
  page.should have_content("Name of Restaurant*:") # express the regexp above with the code you wish you had
end

Then(/^I should see Name of Restaurant field$/) do
  page.should have_css('input[name=restName]')
end

Then(/^I should see the Must \- Try label$/) do
  page.should have_content("Must - Try:") # express the regexp above with the code you wish you had
end

Then(/^I should see Must \- Try field$/) do
  page.should have_css('.rating-panel-wrapper .must-try-qr input') # express the regexp above with the code you wish you had
end

Then(/^I should see the Address label$/) do
  within('.section-sub-subtitle') do 
    page.should have_content("Address")
  end
end

Then(/^I should see the Address field$/) do
  page.should have_css('.address-textarea') # express the regexp above with the code you wish you had
end

Then(/^I should see the Recommendation label$/) do
  page.should have_content("Recommendation*:") # express the regexp above with the code you wish you had
end

Then(/^I should see vote buttons$/) do
  page.should have_css('.vote-panel .vote-up')
  page.should have_css('.vote-panel .vote-down') # express the regexp above with the code you wish you had
end

Then(/^I should see the Price label$/) do
  page.should have_content("Price*:") # express the regexp above with the code you wish you had
end

Then(/^I should see the price's rank button$/) do
  page.should have_css('.price-range1')
  page.should have_css('.price-range2')
  page.should have_css('.price-range3')
  page.should have_css('.price-range4')
  page.should have_css('.price-range5')
end

Then(/^I should see Submit review button$/) do
  page.should have_css('#submit-review-btn') # express the regexp above with the code you wish you had
end

Then(/^I should see the Next button$/) do
  page.should have_css('.next-review-btn') # express the regexp above with the code you wish you had
end

Then(/^I click close Quick Review button$/) do
  find('.review-top .close').click # express the regexp above with the code you wish you had
end

Then(/^The quick review window should close properly$/) do
  page.should have_no_content("QUICK REVIEW") # express the regexp above with the code you wish you had
end

When(/^I submit a quick review without input the restaurant name$/) do 
  find('#submit-review-btn').click
end 

Then(/^The error message for missing restaurant name should display properly$/) do 
  page.driver.browser.switch_to.alert.text.should eq Var0012[:alert_msg_rname]
  page.driver.browser.switch_to.alert.accept
end 

When(/^I submit a quick review without input the restaurant vote$/) do 
  add_quick_review(Var0012[:rest_name], must_try, true, Var0012[:rest_address], '', 'no')
end 

Then(/^The error message for missing vote should display properly$/) do 
  page.driver.browser.switch_to.alert.text.should eq Var0012[:alert_msg_vote]
  page.driver.browser.switch_to.alert.accept
end 

When(/^I submit a quick review without input the restaurant price range$/) do
  add_quick_review(Var0012[:rest_name], must_try , false, Var0012[:rest_address],'up','no')
end

Then (/^The error message for missing price range should display properly$/) do 
  page.driver.browser.switch_to.alert.text.should eq Var0012[:alert_msg_price]
  page.driver.browser.switch_to.alert.accept
end 

When(/^I submit a valid quick review$/) do
  add_quick_review(Var0012[:rest_name], must_try, true, Var0012[:rest_address],'up','no')
end

Then(/^The Review should submit successful$/) do
  page.should have_content("#{Var0012[:qreview_tkmsg]}") # express the regexp above with the code you wish you had
end

When(/^I add a quick review first$/) do
  add_quick_review(Var0012[:rest_name], must_try, Var0012[:rest_address],'up','yes') 
end

And(/^I click continue button then add new quick review$/) do
  add_quick_review(Var0012[:rest_name], must_try, Var0012[:rest_address],'down','no') # express the regexp above with the code you wish you had
end

Then(/^The next Review should add successful$/) do
  page.should have_content("#{Var0012[:qreview_tkmsg]}")
end

When(/^I switch to add full review page$/) do
  find('.review-top .section-title .pull-left:nth-child(2) .grey-btn').click # express the regexp above with the code you wish you had
end

Then(/^Add Full review page should display properly$/) do
  page.should have_content("#{Var0012[:full_review_text]}") # express the regexp above with the code you wish you had
end
