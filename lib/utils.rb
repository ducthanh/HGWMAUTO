###Define action
def login(email, password)
  visit "http://hungrygowhere.my/"
  find(:xpath, "//a[contains(@data-toggle, \"modal\")]").click
  sleep 4
  find('.sign-in > div:nth-child(2) > input:nth-child(2)').set email
  find('input.left:nth-child(3)').set password
  find(:xpath, "//a[contains(@class, \"submit signin-btn\")]").click
  sleep 2
end

def openUrl
  visit "http://hungrygowhere.my/"
end

def openUrltest(url)
  visit url
end

def set_window_size(width, height)
  window = Capybara.current_session.driver.browser.manage.window
  window.resize_to(width, height)
end

def login_facebook (username, password)
  visit 'https://www.facebook.com'
  fill_in("email", :with => username)
  fill_in("pass", :with => password)
  if(page.has_css?('#loginbutton #u_0_e '))
    click_button('u_0_e')   
  end
  
  if(page.has_css?('#loginbutton #u_0_c '))
    click_button('u_0_c')
  end
end

def add_quick_review(rest_name, must_try, price = true, address, vote, cont)
  find('input[name=restName]').native.send_keys rest_name

  while has_css?('ul[class="typeahead dropdown-menu"]') do
    find('input[name=restName]').native.send_keys :space
    sleep 3
    find('ul[class="typeahead dropdown-menu"]').click
  end 

  # find('input[name=restName]').native.send_keys :space
  # sleep 5
  # find('input[name=restName]').native.send_keys :return
  # if page.has_css?('ul[class="typeahead dropdown-menu"]')
  #   find('ul[class="typeahead dropdown-menu"]').click
  # end 



  must_try.each do |try_keys| 
    find('input[name=dishName]').native.send_keys try_keys # express the regexp above with the code you wish you had
    sleep 1
    find('.dropdown-menu').click
  end

  if(price)
    find('.price-range3').click
  end
  find('.address-textarea').set address

  if(vote == 'up')
    find('.vote-up').click
  elsif(vote == 'down')
    find('.vote-down').click
  else
    vote == ""
  end
  find('#submit-review-btn').click

  if(cont == 'yes')
    find('.thanks .grey-btn').click
  end
end 


def search(type, rest_or_dish_name,state,city)
  openUrl
  find(:css, '.flag-panel').click
  click_link(state)
  if(type == "rest")
    find('.search-types .collection_radio_buttons', :text=> 'Restaurant').click
    fill_in("search_name",:with => rest_or_dish_name)
    fill_in("search_street_name", :with => city)
    find(:xpath, "//input[contains(@class, \"btn submit-btn pull-left\")]").click
  end

  if (type == "dish")
    find('.search-types .collection_radio_buttons', :text=> 'Dish').click
    fill_in("search_dish_name",:with => rest_or_dish_name)
    fill_in("search_street_name", :with => city)
    find(:xpath, "//input[contains(@class, \"btn submit-btn pull-left\")]").click
  end 
  page.execute_script "window.scrollBy(0,630)"
end 

def openUserProfile 
  login(Var008[:email], Var008[:password])
  find('.arrow-section').click
  click_link("My Profile") 
end 


#   SEARCH_BOX        = { id: 'gbqfq'     }
#   SEARCH_BOX_SUBMIT = { id: 'gbqfb'     }
#   TOP_SEARCH_RESULT = { css: '#rso .g'  }
#@driver.quit
  # page.driver.browser.all(:xpath,'//input[@name="profile_image"]')[0].send_keys('/Users/2359media/Dropbox/HGWMAUTO/features/upload-files/image.jpg')
  # debugger
  # find(:css, "#search-results .restaurant:nth-child(1) .restaurant-wrapper .rest-social .rest-social-wrapper-top .happy .like-percent .rating").text.slice(0,1)
  # debugger
  # (1..8).each do |i|
  #  find(:css, "#search-results .restaurant:nth-child(#{i}) .restaurant-wrapper .rest-social .rest-social-wrapper-top .votes .like-cnt .votes").text.to_i.should >= find(:css, "#search-results .restaurant:nth-child(#{i+1}) .restaurant-wrapper .rest-social .rest-social-wrapper-top .votes .like-cnt .votes").text.to_i
  # end
  # sleep 1
#page.execute_script('$(".whiteoverlay1").eq(1).trigger("mouseenter")')
#all(:xpath, '//button[@id="btn"]')[0].click
# first(:css, '.whiteoverlay1').hover
# click_link('')
#page.driver.browser.manage.window.resize_to(320, 480) #Responsive a
# def upload_file
#   find(:css, '.fileinput-button').click
# end find('.section', :visible => true, :wait => 6, :text => 'Capybara R', :match => :first)

# within(:xpath, '//ul/li') { ... }
# find(:xpath, '//ul/li').text
# find(:xpath, '//li[contains(.//a[@href = "#"]/text(), "foo")]').value

# Capybara.add_selector(:id) do
#   xpath { |id| XPath.descendant[XPath.attr(:id) == id.to_s] }
# end
 
# Capybara.add_selector(:row) do
#   xpath { |num| ".//tbody/tr[#{num}]" }
# end
# <input type="file" multiple="multiple" accept="image/jpeg,image/gif,image/png" style="font-size: 999px; position: absolute; width: 100%; height: 100%;">
 
# page.driver.browser.all(:xpath, '//input[@accept="image/jpeg,image/gif,image/png"]')[0].send_keys(Dir.getwd + 'img.jpg')

# Capybara.add_selector(:flash_type) do
#   css { |type| "#flash.#{type}" }
# end
#cucumber <featurename>.feature --format html --out report.html --format pretty 