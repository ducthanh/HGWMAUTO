Var004 = {
	testemail: "test" + rand(10000).to_s + "@2359media.com", 
	password: '123456',
 	confirm_pw: '123456',
	dname: 'Account Test',
	login_errormsg: "Email or Password is invalid",
	valid_email: '2359testvn@gmail.com',
	valid_password: '123456',
	login_successmsg_fb:"You have successfully logged in.",
	login_successmsg_mail:"You have successfully logged in"
}

Given(/^TC_004 Visit Facebook page then login$/) do
	login_facebook('2359testvn@gmail.com', '2359media')
end

And(/^I visit the HGWM page$/) do
	openUrl 
	set_window_size(1150, 1300)
end

And(/^I open login page$/) do
	find(:css, '.col-login .col-login-wrapper a').click
  sleep 1 
end

Then(/^I should see the Email login field$/) do
  page.should have_css('.sign-in .others-wrapper .textinput')
end

Then(/^I should see the Password filed$/) do
  page.should have_css('.sign-in .others-wrapper .textinput2')
end
Then(/^I should see the Login button$/) do
  page.should have_css('a.submit:nth-child(6)')
end

Then(/^I should see the Forgot password link$/) do
  page.should have_link("Forgot your password?", :href=>"/profile/forget_password") 
end

Then(/^I should see the Remember check box$/) do
  page.should have_css('.remember')
end


#FACEBOOK
And(/^I click the Login by Facebook button$/) do
  find(:css, '#myModal .modal-body .login-facebook a').click
  if(page.has_css?('#u_0_7'))
  	find(:css,'.uiOverlayFooterButtons ._42ft:nth-child(2)').click
  end
end

Then(/^I should login successful$/) do
	page.should have_content("You have successfully logged in.")
	find(:css, '.pull-right .arrow-section').click
	find(:css, '.dropdown-menu li:nth-child(3) a').click
end

#Login by Email function
And(/^I login in by and invalid email account$/) do
  login('invalidemail@test.com','123456')
end

Then(/^I can not login, the error message for invalid email address should be displayed/) do
 page.should have_content(Var004[:login_errormsg])
end

And(/^I login in by and valid email but wrong password$/) do
  login('2359testvn@gmail.com','1233446')
end

Then(/^I can not login, the error message for invalid email or password should be displayed$/) do
 page.should have_content(Var004[:login_errormsg])
end

Then(/^I login with an account which did not active yet$/) do
	openUrl
	find(:xpath, "//a[contains(@data-toggle, \"modal\")]").click
	find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password 
  find(:xpath,'//*[@id="myModal"]/div[2]/div[4]/div[2]/div[2]/label/input').click
  find(:css, '.sign-up .others-wrapper .submit').click
  login(Var004[:testemail],Var004[:password])
  sleep 2
end

Then(/^The error message for email did not active yet should be displayed$/) do
	page.should have_content(Var004[:login_errormsg]) 
end

Then(/^I login with a valid account with email and password$/) do
  login(Var004[:valid_email],Var004[:valid_password]) # express the regexp above with the code you wish you had
end

Then(/^I should login successfully$/) do
  page.should have_content(Var004[:login_successmsg_mail])
end

Then(/^I logout the account$/) do
	find(:css, '.pull-right .arrow-section').click
	find(:css, '.dropdown-menu li:nth-child(3) a').click
end

Then(/^I should log out successful$/) do
	page.should have_no_css('.pull-right .arrow-section')
end

# Then(/^I recover the password by inputing an invalid email address$/) do
#   openUrl
# 	find(:xpath, "//a[contains(@data-toggle, \"modal\")]").click
# end

# Then(/^The error message for inputing an invalid email address should be displayed$/) do
#   click_link('Forgot your password?')
# end

# Then(/^I recover the password by inputing an invalid email format$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^The error message for inputing an invalid email format should be displayed$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I recover the password by inputing a vaild email address$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I should recover password successful$/) do
#   pending # express the regexp above with the code you wish you had
# end
