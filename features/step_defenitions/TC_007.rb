Var007 = {
	search_found_yes: /[1-9]\d*( results were found)/,
	dish_name1: 'Grilled Steak',
	dish_name2: 'Poon Choi',
	dish_name3: 'Curry Prawns',
	dish_name4: 'Various Dim Sum',
	dish_name5: 'Bread',
	state1: 'Klang Valley',
	state2: 'Penang',
	state3: 'Johor',
	state4: 'Melaka', 
	state5: 'Ipoh',
	valid_email: '2359testvn@gmail.com',
 	valid_password: '123456',
 	invalid_dishname: 'this is invalid dish name'
}

Given(/^Open the HGWM to check the searching dish feature$/) do
  openUrl
  set_window_size(1150, 1350)
end

When(/^I search for a dish at Klang Valley$/) do
  search('dish', Var007[:dish_name1], Var007[:state1], '')
end

Then(/^Klang Valley I should see the message return properly$/) do
  page.should have_content(Var007[:search_found_yes])
end

#Check DishName return

Then(/^Klang Valley the dish name return should match with search term$/) do
   all('.dish-box-wrapper .dish-box-inner-wrapper .unexpanded .dish-name').each{
   	|dish_name| dish_name.text.should match(/#{Var007[:dish_name1]}/)
   }
end

Then(/^The information of dish should be display properly when hovering$/) do
  all(".dish-box-wrapper").each{
						  		|dish| dish.hover
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-cat-logo')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-name ')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-place .dish-place-address')
						  		find('.dish-box-wrapper .dish-box-inner-wrapper .expanded .like-cnt').text.should match(/(0|[1-9]+)/)
						  	}
						  		
end

Given(/^I search for dish in Penang at George Town$/) do
  search('dish', Var007[:dish_name2], Var007[:state2], 'George Town')
end

Then(/^I should see the message result at Penang$/) do
  page.should have_content(Var007[:search_found_yes])
end

Then(/^Penang the dish name return should match with search term$/) do
  all('.dish-box-wrapper .dish-box-inner-wrapper .unexpanded .dish-name').each{
   	|dish_name| dish_name.text.should match(/#{Var007[:dish_name2]}/)}
end

Then(/^Penang the information of dish should be display properly when hovering$/) do
  all(".dish-box-wrapper").each{
						  		|dish| dish.hover
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-cat-logo')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-name ')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-place .dish-place-address')
						  		find('.dish-box-wrapper .dish-box-inner-wrapper .expanded .like-cnt').text.should match(/(0|[1-9]+)/)}

end

Given(/^I search for dish in Johor$/) do
  search('dish', Var007[:dish_name3], Var007[:state3], '')
end

Then(/^Johor I should see the result message$/) do
  page.should have_content(Var007[:search_found_yes])
end

Then(/^Johor the dish name should match with search term$/) do 
	all('.dish-box-wrapper .dish-box-inner-wrapper .unexpanded .dish-name').each{
   	|dish_name| dish_name.text.should match(/#{Var007[:dish_name3]}/)}
end 

Then(/^Johor the information of dish should be display properly when hovering$/) do 
	all(".dish-box-wrapper").each{
						  		|dish| dish.hover
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-cat-logo')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-name ')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-place .dish-place-address')
						  		find('.dish-box-wrapper .dish-box-inner-wrapper .expanded .like-cnt').text.should match(/(0|[1-9]+)/)
						  	}
end

Given(/^I search for dish in Mekala at Taman Malim Jaya$/) do
  search('dish', Var007[:dish_name4], Var007[:state4], 'Taman Malim Jaya')
end

Then(/^Malacca I should see the result message$/) do
  page.should have_content(Var007[:search_found_yes])
end

Then(/^Malaka the dish name return should match with search term$/) do
   all('.dish-box-wrapper .dish-box-inner-wrapper .unexpanded .dish-name').each{
   	|dish_name| dish_name.text.should match(/#{Var007[:dish_name4]}/)}
end

Then(/^Malaka the information of dish should be display properly when hovering$/) do 
	all(".dish-box-wrapper").each{
						  		|dish| dish.hover
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-cat-logo')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-name')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-place .dish-place-address')
						  		find('.dish-box-wrapper .dish-box-inner-wrapper .expanded .like-cnt').text.should match(/(0|[1-9]+)/)
						  	}
						  		
end

Given(/^I login to check dish search function$/) do
	login(Var007[:valid_email],Var007[:valid_password]) 
end 

When(/^I search for dish in Ipoh$/) do
	set_window_size(1450, 1450)
  search('dish', Var007[:dish_name5], Var007[:state5], '')
end

Then(/^Ipoh I should see the result message$/) do
  page.should have_content(Var007[:search_found_yes])
end

Then(/^Ipoh the search result should return properly/) do
  result = (find('#entries').text.to_f/9).ceil
  for i in 1..result 
  	all('.dish-box-wrapper .dish-box-inner-wrapper .unexpanded .dish-name').each{
   	|dish_name| dish_name.text.should match(/#{Var007[:dish_name5]}/)
   }
   all(".dish-box-wrapper").each{
						  		|dish| dish.hover
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-cat-logo')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-name ')
						  		page.should have_css('.dish-box-wrapper .dish-box-inner-wrapper .expanded .dish-place .dish-place-address')
						  		find('.dish-box-wrapper .dish-box-inner-wrapper .expanded .like-cnt').text.should match(/(0|[1-9]+)/)
						  	}

  	find(:css,'.next_page').click 
  	sleep 5
  	page.execute_script 'window.scrollBy(0,240)'
  end
end

Given (/^I search for invalid dishname/) do 
	search('dish', Var007[:invalid_dishname], Var007[:state5], '') 
end 

Then (/^There are no result return/) do 
	page.should have_no_content(Var007[:search_found_yes])
end 


