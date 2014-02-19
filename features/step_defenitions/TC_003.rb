Var1 = {
	testemail: "test" + rand(10000).to_s + "@2359media.com", 
	password: '123456',
  confirm_pw: '123456',
  missmatch_pw: 'abcdefg',
  email_taken: '2359testvn@gmail.com',
	dname: 'Account Test',
	regmsg: "I have read, understood and accept the",
  missfield_error: "Please fill up all fields",
  missmatch_error: "Please enter the same password in your confirmation.",
  tearm_error: "Please agree to the Terms and Conditions before proceeding.",
  email_error1: "test@testcom",
  email_error2: "testtest.com",
  invalid_emailmsg: "email is invalid",
  email_taken_error: "email has already been taken.",
  reg_success_msg: "Thanks for signing up with us! We have sent an activation email to the email address you've provided."
}

Given(/^TC_003 Open the HGWM page$/) do
  openUrl
  set_window_size(1150, 1300)
end

Given(/^I open the Registration pop up$/) do
  find(:css, '.col-login .col-login-wrapper a').click
  sleep 1 
end

Then(/^The registration pop up should be displayed$/) do
  page.should have_content(Var[:regmsg])
end

Then(/^I close the Registration pop up$/) do
  find(:css, '#myModal .close').click
  sleep 1
end

Then(/^the registration pop up should be disappeared$/) do #Submit button cannot be seen 
  page.should have_no_css('.sign-up .others-wrapper .submit')
end

Then(/^I open the Registration pop up again$/) do
  find(:css, '.col-login .col-login-wrapper a').click
end

Then(/^I should see the Display Name field$/) do
	page.should have_css('.sign-up .others-wrapper .grey-top-box:nth-of-type(1)')
end

Then(/^I should see the Email field$/) do
  page.should have_css('.sign-up .others-wrapper .grey-top-box:nth-of-type(2)')
end

Then(/^I should see the Password field$/) do
  page.should have_css('.sign-up .others-wrapper .grey-top-box:nth-of-type(3)')
end

Then(/^I should see the Confirm password field$/) do
  page.should have_css('.sign-up .others-wrapper .grey-top-box:nth-of-type(4)')
end

Then(/^I should see the term of service link$/) do
	page.should have_link("Terms of Service and Privacy Policy", :href=>"/termsandconditions")
end

Then(/^I should see the agree check box$/) do
	page.should have_xpath('//*[@id="myModal"]/div[2]/div[4]/div[2]/div[2]/label/input')
end

Then(/^I submit the Registration without input Display Name$/) do
  #find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
	find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for missing of Display Name should be displayed$/) do
  page.should have_content(Var[:missfield_error])
end

Then(/^I submit the Registration without Email$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set "" #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for missing Email should be displayed$/) do
  page.should have_content(Var[:missfield_error])
end

Then(/^I submit the Registration without Password$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set "" #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set "" #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for missing Password field should be displayed$/) do
  page.should have_content(Var[:missfield_error])
end

Then(/^I submit the Registration without the Confirm password$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set "" #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^the error message for missging Confirm password should be displayed$/) do
  page.should have_content(Var[:missfield_error])
end

Then(/^I submit the Registration that the Confirm password missmatch the password$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:missmatch_pw] #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for password missmatch should be displayed$/) do
  page.should have_content(Var1[:missmatch_error])
end

Then(/^I submit the Registration without agree Team of Service$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for missing the agreeability should be displayed$/) do
  page.should have_content(Var[:tearm_error])
end

Then(/^I submit the Registration with an invalid email address$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:email_error1] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for invalid email register should be displayed$/) do
  page.should have_content(Var[:invalid_emailmsg])
end 

Then(/^I submit the Registration with an email that is already existed$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:email_error1] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password 
  find(:xpath,'//*[@id="myModal"]/div[2]/div[4]/div[2]/div[2]/label/input').click
  find(:css, '.sign-up .others-wrapper .submit').click
end

Then(/^The error message for the email already existed should be displayed$/) do
  page.should have_content(Var[:email_taken_error])
end

Then(/^I submit the vailid Registration information$/) do
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(1)').set Var1[:dname] #Display Name 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(2)').set Var1[:testemail] #Email 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(3)').set Var1[:password] #Password 
  find(:css, '.sign-up .others-wrapper .grey-top-box:nth-of-type(4)').set Var1[:confirm_pw] #Confirm Password 
  #find(:xpath,'//*[@id="myModal"]/div[2]/div[4]/div[2]/div[2]/label/input').click
  find(:css, '.sign-up .others-wrapper .submit').click
  sleep 2
end

Then(/^The new account should be created$/) do
  page.should have_content(Var1[:reg_success_msg])
end
