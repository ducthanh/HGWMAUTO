Var009 = {
  invalid_message: 'Please fill in your display name.',
  changed_displayname: 'SteveT',
  changed_firstname: 'Test' ,
  changed_lastname: 'Account',
  display_name: 'SteveT Nguyen',
  first_name: 'SteveT',
  last_name: 'Nguyen',
  dob: "13/10/1987",
  age_group: "25 to 34 years", 
  monthly_income: "4,001RM - 8,000RM", 
  user_state: "Putrajaya", 
  website: "http://www.hungrygowhere.my",
  occupation: "Banking / Finance",
  monthly_income: '4,001RM - 8,000RM',
  state: "Putrajaya",
  invalid_website: "testcom",
  error_msg: "Please fill in a valid URL starting with http(s)://",
  user_desc: "I'm a food lover"
}

Given(/^Open the edit profile page$/) do
  openUserProfile 
  set_window_size(1350, 1300)
  find(:css,'.btn-edit a').click
end

Then(/^I should see the Photo label$/) do
	find(:css,'label[for=user_profile_image]').text.should eq "Photo"
end

Then(/^I should see the Change Photo button$/) do
  find('.input .change-photo').text.should eq "CHANGE PHOTO"
end

Then(/^I should see the Display Name label$/) do 
	find(:css,'label[for=user_display_name]').text.should eq "Display Name"
end

Then (/^I should see the Display Name textbox$/) do 
	page.should have_css('#user_display_name')
end

Then(/^I should see the First Name label$/) do
	find(:css,'label[for=user_first_name]').text.should eq "First Name"
end

Then(/^I should see the First Name textbox$/) do
	page.should have_css('#user_first_name')
end

Then(/^I should see the Last Name label$/) do
	find(:css,'label[for=user_last_name]').text.should eq "Last Name"
end

Then(/^I should see the Last Name textbox$/) do 
	page.should have_css('#user_last_name')
end 

Then(/^I should see the genders label$/) do
  find(:css,'label[for=user_gender]').text.should eq "Gender"
end

Then(/^I should see the gengers option box$/) do
  find(:css,'label[for=user_gender_male]').text.should eq "Male"
  find(:css,'label[for=user_gender_female]').text.should eq "Female"
end

Then(/^I should see the Date Of Birth label$/) do
    find(:css,'label[for=user_birthdate]').text.should eq "Date of Birth"
end

Then(/^I should see the Date of Birth calendar$/) do
  page.should have_css('.datepicker-icon')
end

Then(/^I should see the Age Group label$/) do
  find(:css,'label[for=user_age_group]').text.should eq "Age Group"
end

Then(/^I should see the Age Group select box$/) do
  page.should have_css('button[data-id=user_age_group]')
end

Then(/^I should see the Occupation label$/) do
  find('label[for=user_occupation]').text.should eq "Occupation"
end

Then(/^I should see the Occupation select box$/) do
  page.should have_css('button[data-id=user_occupation]')
end

Then(/^I should see the Monthly Income label$/) do
  find('label[for=user_income]').text.should eq "Monthly Income"
end

Then(/^I should see the Monthly Income select box$/) do
	page.should have_css('button[data-id=user_income]')
end

Then(/^I should see the State label$/) do 
	find('label[for=user_state]').text.should eq "State"
end 

Then(/^I should see the State select box$/) do
  page.should have_css('button[data-id=user_state]')
end

Then(/^I should see the website label$/) do
  find('label[for=user_url]').text.should eq "Website"
end

Then(/^I should see the website text box$/) do
  page.should have_css('#user_url')
end

Then(/^I should see the Description label$/) do
  find('label[for=user_description]').text.should eq "Description"
end

Then(/^I should see the Description text box$/) do
  page.should have_css('#user_description')
end

Then(/^I should see the Save Changes button$/) do
  find('.actions .save-changes').text.should eq "SAVE CHANGES"
end

Then(/^I should see the Cancel button$/) do
  find('.actions .cancel').text.should eq "CANCEL"
end

When(/^I upload a new photo image$/) do
	#find(:css,'.btn-edit a').click
  find('.change-photo').click
  page.driver.browser.all(:xpath,'//input[@name="profile_image"]')[0].send_keys(Dir.getwd + "/features/upload-files/image.jpg")
  find('#edit_profile .close').click
  
end

Then(/^The image should be change successful$/) do
	find('.profile-section .img-circle')['src'].should match('image.jpg')
end

When(/^The Display name field is empty$/) do
  fill_in('user_display_name',:with=> "")
  find('.save-changes').click
end

Then(/^The error message for Display Name field display$/) do
  page.should have_content("#{Var009[:invalid_message]}")
end

When(/^I change the First Name \- Last Name and Display Name$/) do
  fill_in('user_display_name', :with => "#{Var009[:changed_displayname]}")
  fill_in('user_first_name', :with => "#{Var009[:changed_firstname]}")
  fill_in('user_last_name', :with => "#{Var009[:changed_lastname]}")
  find('.save-changes').click
end

Then(/^The profile names change successful$/) do
  #Display Name
  #exdebugger#find('.user-fullname .text-ellipsis').text
  #find('.user-fullname .text-ellipsis').text.should eq "#{Var009[:changed_displayname]}"
  page.execute_script 'window.scrollBy(0,-240)'
  sleep 2
  find(:css,'.btn-edit a').click
  find('#user_display_name').value.should eq "#{Var009[:changed_displayname]}"
  find('#user_first_name').value.should eq "#{Var009[:changed_firstname]}"
  find('#user_last_name').value.should eq "#{Var009[:changed_lastname]}"
end

When(/^I change the Date of Birth$/) do
  find('.datepicker-icon').click # express the regexp above with
  find('.table-condensed tbody tr:nth-child(3) td:nth-child(3)').click
  find('.save-changes').click
end

Then(/^The date of birth should change successful$/) do 
  sleep 2
  find(:css,'.btn-edit a').click
  find('#user_birthdate')['value'].should eq "#{Var009[:dob]}"# express the regexp above with the code you wish you had
end

When(/^User change Age Group \- Occupation \- Monthly Income and State$/) do
  find('button[data-id=user_age_group]').click
  find('.dropdown-menu li:nth-child(4) a').click
  find('button[data-id=user_occupation]').click
  find('.dropdown-menu li:nth-child(4) a').click
  find('button[data-id=user_income]').click
  find('.dropdown-menu li:nth-child(4) a').click
  find('button[data-id=user_state]').click
  find('.dropdown-menu li:nth-child(4) a').click
  find('.save-changes').click
  sleep 2
end

Then(/^The Age Group \- Occupation \- Monthly Income and State should change successful$/) do
  find(:css,'.btn-edit a').click 
  find('button[data-id=user_age_group] .filter-option').text.should eq "#{Var009[:age_group]}"
  find('button[data-id=user_occupation] .filter-option').text.should eq "#{Var009[:occupation]}"
  find('button[data-id=user_income] .filter-option').text.should eq "#{Var009[:monthly_income]}"
  find('button[data-id=user_state] .filter-option').text.should eq "#{Var009[:user_state]}"
end

When(/^I input an invalid website format$/) do
  find('#user_url').set "#{Var009[:invalid_website]}"
  find('.save-changes').click #all 
end

Then(/^The error message of invalid website format should display$/) do
  page.should have_content("#{Var009[:error_msg]}")
end

When(/^I input a valid website format$/) do
  find('#user_url').set "#{Var009[:website]}" # express the regexp above with the code you wish you had
  find('.save-changes').click #all 

end

Then(/^The website should save successful$/) do
  find('.user-info .website a')['href'].should match("#{Var009[:website]}")
  sleep 2
end

When(/^I update the describle$/) do
  find('#user_description').set "#{Var009[:user_desc]}" # express the regexp above with the code you wish you had
  find('.save-changes', :wait => 2).click 
  sleep 1
end

Then(/^the describe should save successful$/) do
  find('.user-info .quote').text.should eq "#{Var009[:user_desc]}" # express the regexp above with the code you wish you had
  sleep 2
  find(:css, '.btn-edit a').click

  #Rollback Data
  #Photo 
  find('.change-photo').click
  page.driver.browser.all(:xpath,'//input[@name="profile_image"]')[0].send_keys(Dir.getwd + "/features/upload-files/image3.jpg")

  #NAME
  fill_in('user_display_name', :with => "#{Var009[:display_name]}")
  fill_in('user_first_name', :with => "#{Var009[:first_name]}")
  fill_in('user_last_name', :with => "#{Var009[:last_name]}")

  #DOB
  find('.datepicker-icon').click # express the regexp above with
  find('.table-condensed tbody tr:nth-child(3) td:nth-child(3)').click

  #Dropdown list
  find('button[data-id=user_age_group]').click
  find('.dropdown-menu li:nth-child(2) a').click
  find('button[data-id=user_occupation]').click
  find('.dropdown-menu li:nth-child(2) a').click
  find('button[data-id=user_income]').click
  find('.dropdown-menu li:nth-child(2) a').click
  find('button[data-id=user_state]').click
  find('.dropdown-menu li:nth-child(2) a').click
  #website
  find('#user_url').set "http://test.com"
  #description
  find('#user_description').set "Food Lover" 
  find('.save-changes').click
end
