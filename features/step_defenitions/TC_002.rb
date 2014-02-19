Var = { name: 'Mr Bean Malaysia at The Curve', 
        hgwm_intro: 'HungryGoWhere Malaysia is your Kaki Makan, who helps you discover what to eat and where to eat In Malaysia.',
        email_invalid: '2359test@vn',
        email_vaild: 'testvn@2359media.com.vn',
        first_name: 'test',
        last_name: 'account',
        copyright: 'SingTel Digital Media Pte Ltd. All Rights Reserved',
        email_error: 'Please enter a valid email address.',
        confirm_subcribe: 'We need to confirm your email address. To complete the subscription process, please click the link in the email we just sent you.'
      }

Given(/^TC_002 Open the HGWM page$/) do
  openUrl # express the regexp above with the code you wish you had
  set_window_size(1150, 1300)
end

And(/^I scroll page to the bottom$/) do
  page.execute_script "window.scrollBy(0,10000)"
end

Then(/^The footer should be displayed$/) do
  page.should have_content(Var[:copyright])
end

Then(/^I expand the Footer$/) do
  find(:css, 'div.footerindex').click
end
#CHECK UI 
Then(/^I should see the intro content$/) do
  page.should have_content(Var[:hgwm_intro])
end

Then(/^I should see Facebook Like message$/) do
  page.should have_css('html.mti-helveticaneuew01ultltc673371-n4-active body div.clearfix div#footer.navbar ul.pull-right li:nth-child(1)')
end

Then(/^I should see Twitter Follow button$/) do
  page.should have_css('html.mti-helveticaneuew01ultltc673371-n4-active body div.clearfix div#footer.navbar ul.pull-right li:nth-child(2)')
end

Then(/^I should see About Us link$/) do
  page.should have_link("About Us", :href=>"/about-us/?city_locale=kuala-lumpur") # express the regexp above with the code you wish you had
end

Then(/^I should see Contact Us link$/) do
  page.should have_link("Terms & Conditions", :href=>"/terms-and-conditions/?city_locale=kuala-lumpur") # express the regexp above with the code you wish you had
end

Then(/^I should see Terms & Conditions link$/) do
  page.should have_link("Contact Us", :href=>"/contact-us/?city_locale=kuala-lumpur") # express the regexp above with the code you wish you had
end

Then(/^I should see Email text field$/) do
  page.should have_field("EMAIL")
end

Then(/^I should see FirstName textfield$/) do
  page.should have_field("FNAME")
end

Then(/^I should see LastName textfield$/) do
  page.should have_field("LNAME")
end

Then(/^I should see the Subcribe button$/) do
  page.should have_button("mc-embedded-subscribe")
end

Then(/^I reduce the footer$/) do
  find(:css, 'div.footerindex').click
end

Then(/^The footer should be reduced$/) do
 page.should have_no_content("Terms & Conditions")
end

#FUNCTION

Then(/^I input the Subscribe information with an invalid email address$/) do
  find(:css, 'div.footerindex').click
  fill_in("EMAIL",:with => Var[:email_invalid])
  fill_in("FNAME", :with => Var[:first_name])
  fill_in("LNAME", :with => Var[:last_name])
end

Then(/^I click Subcribe button$/) do
  click_button('mc-embedded-subscribe')
end

Then(/^The error message for Invalid email address should be displayed$/) do
  page.should have_content(Var[:email_error])
end

Then(/^I input the Subcribe information without FirstName$/) do
  fill_in("EMAIL",:with => Var[:email_vaild])
  fill_in("FNAME", :with => "")
  fill_in("LNAME", :with => Var[:last_name])
  click_button('mc-embedded-subscribe')
end

Then(/^The error message for missing Firstname should be displayed$/) do
  page.should have_css('#mce-FNAME + .mce_inline_error')
end

Then(/^I input the Subcribe information without Lastname$/) do
  fill_in("EMAIL",:with => Var[:email_vaild])
  fill_in("FNAME", :with=> Var[:first_name])
  fill_in("LNAME", :with => Var[""])
  click_button('mc-embedded-subscribe')
end

Then(/^The error message for missing Lastname should be displayed$/) do
  page.should have_css('#mce-LNAME + .mce_inline_error')
end

Then(/^I input a valid Subcrible information$/) do
  fill_in("EMAIL",:with => Var[:email_vaild])
  fill_in("FNAME", :with => Var[:first_name])
  fill_in("LNAME", :with => Var[:last_name])
  click_button('mc-embedded-subscribe')
end

Then(/^I should Subcribe successful$/) do
  page.should have_content(Var[:confirm_subcribe])
end