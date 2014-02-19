Var005 = {
					invalid_emailmsg: "The email doesn't exist in our database",
					recovery_success: "We already sent an email to you. please check your account",
					email_gmail: '2359testvn@gmail.com',
					email_password: 'ducthanh12'
				 }

Given(/^Open the HGWM recovery passsword$/) do
  openUrl
  set_window_size(1100, 1200)
  find(:xpath, "//a[contains(@data-toggle, \"modal\")]").click
  click_link('Forgot your password?')
end

Then(/^The recovery password page should be displayed$/) do
  page.should have_content("Receiving new password")
end

Then(/^I should see Email field$/) do
  page.should have_css('#email')
end

Then(/^I should see Submit button$/) do
  page.should have_css('.actions .submit-btn')
end

Then(/^I click Submit button without inputing email$/) do
  find(:css,'.actions .submit-btn').click
end

Then(/^I should see the error message to require email input$/) do
  page.should have_content("You need to enter email")
end

Then(/^I recover the password by inputing an invalid email address$/) do
  fill_in('email',:with => "email_ivl@2359test.com.vn")
  find(:css,'.actions .submit-btn').click
end

Then(/^The error message for inputing an invalid email address should be displayed$/) do
  page.should have_content(Var005[:invalid_emailmsg])
end

Then(/^I recover the password by inputing an invalid email format$/) do
  fill_in('email',:with => "email_ivl2359test.com.vn")
  find(:css,'.actions .submit-btn').click
end

Then(/^The error message for inputing an invalid email format should be displayed$/) do
  page.should have_content(Var005[:invalid_emailmsg])
end

Then(/^I recover the password by inputing a vaild email address$/) do
  fill_in('email', :with => "2359testvn@gmail.com")
  find(:css,'.actions .submit-btn').click
end

Then(/^I should recover password successful$/) do
  page.should have_content(Var005[:recovery_success])
  openUrltest('https://mail.google.com/mail/?nocheckbrowser&shva=1#inbox')
  click_link('gmail-sign-in')
  fill_in('Email', :with => Var005[:email_gmail])
  fill_in('Passwd', :with=> Var005[:email_password])
  click_button('signIn')
  visit('https://mail.google.com/mail/?ui=html&zy=h')
  first(:css, '.ts b').text.should eq('Password Recovery')
  first(:css, '.ts b').click
  click_link('Delete')
end