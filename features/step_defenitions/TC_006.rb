Var006 = {city:'',
        search_found_yes: /[1-9]\d*( results were found)/,
        restaurant_name1: "Starbucks Coffee",
        restaurant_name2: "Tea Lounge",
        restaurant_name3: "Pizza Hut",
        restaurant_name4: "Restoran Malaysia Raya",
        vote_percent: /\d+(%)/,
        state1: "Johor",
        state2: "Klang Valley",
        state3: "Melaka",
        state4: "Ipoh",
        state5: "Penang",
        valid_email: '2359testvn@gmail.com',
        valid_password: '123456',
        homepage_title: "Malaysia Food Guide, Restaurant Reviews and Rating - HungryGoWhere Malaysia"
        }

Given(/^Open the HGWM search page page$/) do
  openUrl
  set_window_size(1100, 1200)
end

When(/^I search for Starbucks Coffee in Johoh at Johor Bahru$/) do
  #Switch to Johor
  search('rest', Var006[:restaurant_name1],Var006[:state1], 'Johor Bahru')
end 

Then(/^The restaurant information should be displayed properly$/) do
  all(".restaurant-wrapper .rest-details .rest-name a").each {|restname| restname.text.should eq Var006[:restaurant_name1]}
  all('.restaurant-wrapper .rest-social .rest-social-wrapper-top .happy .likes-percent',:exact => :true).each {|percent| percent.text.should match(/\d+(%)/)}
  all('.restaurant-wrapper .rest-social .rest-social-wrapper-top .votes .like-cnt', :exact => :true).each { |vote| vote.text.should match(/\d+/)}
  all(:css, ".bot-details .rest-add span:nth-child(2)").each {|address| address.text.should match(/.#{Var006[:state1]}./)}
  #Address 
end

Then(/^I should see RELEVANCE button$/) do
  find('#sort-by-list > li:nth-child(1) > a:nth-child(1)').text.should eq "RELEVANCE"
end

Then(/^I should see POPULAR button$/) do
  find('#sort-by-list > li:nth-child(2) > a:nth-child(1)').text.should eq "POPULAR"
end

Then(/^I should see DISTANCE button$/) do
  find('#sort-by-list > li:nth-child(3) > a:nth-child(1)').text.should eq "DISTANCE"
end

When(/^I search for Tea Lounge restaurant in Klang Valley at Kuala Lumpur$/) do
  search('rest', Var006[:restaurant_name2],Var006[:state2], 'Kuala Lumpur')
end

Then(/^I should see the number of result return$/) do
  page.should have_content(Var006[:search_found_yes])
end

When(/^I visit the Tea Lounge page$/) do
  find_link("#{Var006[:restaurant_name2]}", :match=>:first).click
end

Then(/^The Tea Lounge page should open successful$/) do
  page.title.should match(/#{Var006[:restaurant_name2]}/)
end

When(/^I search for Pizza Hut in Melaka$/) do
  search('rest', Var006[:restaurant_name3],Var006[:state3], "")
end

Then(/^The number of result should be displayed$/) do
  page.should have_content(Var006[:search_found_yes])
end

When(/^I search for Restoran Malaysia Raya at Ipoh$/) do
  search('rest', Var006[:restaurant_name4],Var006[:state4], '')
end

Then(/^The number of result should be return$/) do
  page.should have_content(Var006[:search_found_yes])
end

Then(/^The Restoran Malaysia Raya restaurant should display in search result$/) do
  all(".restaurant-wrapper .rest-details .rest-name a").each {|restname| restname.text.should eq Var006[:restaurant_name4]}
  all('.restaurant-wrapper .rest-social .rest-social-wrapper-top .happy .likes-percent',:exact => :true).each {|percent| percent.text.should match(/\d+(%)/)}
  all('.restaurant-wrapper .rest-social .rest-social-wrapper-top .votes .like-cnt', :exact => :true).each { |vote| vote.text.should match(/\d+/)}
  all(:css, ".bot-details .rest-add span:nth-child(2)").each {|address| address.text.should match(/.#{Var006[:state4]}./)}
end

Then(/^I login HGWM page to check the search function$/) do
  login(Var006[:valid_email],Var006[:valid_password])
end

When(/^I search for nothing at Penang$/) do
  search('rest',"",Var006[:state5], "")
end
Then(/^the search result should be return successful$/) do
  page.should have_content(Var006[:search_found_yes])
end

Then(/^I should see the Pagination$/) do
  page.execute_script "window.scrollBy(0,10000)"
  page.should have_css('.pagination .next_page')
end

Then(/^I click SUBMIT REVIEW button$/) do
  find(:css,'#backtotop').click
  find(:css, '.navbar-inner .container .nav .col-d .col .submit-review-toggle').click
end

Then(/^The SUBMIT REVIEW section should be displayed$/) do
  page.should have_content("QUICK REVIEW")
  find(:css, '.navbar-inner .container .nav .col-d .col .submit-review-toggle').click
end

Then(/^I click HUNGRY GO WHERE logo$/) do
  find(:css, '.nav .logo1').click
end

Then(/^The browser should be navigated to HomePage$/) do
  page.title.should == Var006[:homepage_title]
end