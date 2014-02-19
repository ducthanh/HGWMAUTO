class Action
include Capybara::DSL
  def goto
    visit "http://hungrygowhere.my/"
  end
  def qrv_gofullrv 
    find('.col-review a').click
    find('.fr-next').click 
  end 
	def search_rest_open(rest_name,state)
	  openUrl
	  find(:css, '.flag-panel').click
	  click_link(state)
	    find('.search-types .collection_radio_buttons', :text=> 'Restaurant').click
	    fill_in("search_name",:with => rest_name)
	    find(:xpath, "//input[contains(@class, \"btn submit-btn pull-left\")]").click
	    find("a", :text => "#{rest_name}").click
	end

	def add_full_review(must_try_list, vote, price, ratings, photo_list_path, suitable_for_list, your_review, atmosphere_list)
    find("a", :text => "ADD FULL REVIEW").click
    # Must-try field
    if(must_try_list)
		  must_try_list.each do |try_keys| 
    	 find('input[name=dishName]').native.send_keys try_keys	
        while has_no_css?('.dropdown-menu') do
          find('input[name=dishName]').native.send_keys :space
          sleep 1
       end
    	find('.dropdown-menu').click
  	 end
    end
  	#Vote
  	if(vote == "up")
  		find('.vote-up').click
  	end

  	if(vote == "down")
  		find('.vote-down').click
  	end

  	if(price)
  		find(".price-range#{price}").click
  	end

    page.execute_script "window.scrollBy(0,230)"
      #Rating  
    if(ratings)
      i = 1
      ratings.each do |rate|
        find(:css, ".ratings .rate:nth-child(#{i}) .star-ph .star:nth-child(#{rate.to_s})").click
        i +=1 
      end
    end
    #Photo
    if(photo_list_path)
      photo_list_path.each do |img|
        page.driver.browser.all(:xpath,'//input[@name="file"]')[0].send_keys(img)
      end
    end
    
    if(suitable_for_list)
      suitable_for_list.each do |item|
        find("li", :text => "#{item}").click
      end
    end 

    if(your_review)
      find('.right-panel .section .content-textarea').set your_review
    end

    page.execute_script "window.scrollBy(0,230)"
    if(atmosphere_list)
      atmosphere_list.each do |item|
        find("li", :text => "#{item}").click
      end
    end
    #SUBMIT
    find('.grey-btn').click
	end
end