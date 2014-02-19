require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'debugger'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'utils')
require 'csv'
require 'rspec-expectations'
# require 'cucumber/formatter/ABC'
#require 'capybara-screenshot/cucumber'
#sudo gem install rspec-rails
##run REMOTE 1
# Capybara.app_host = "http://thanhnguyen.local"

# Chrome
# Capybara.default_driver = :selenium_chrome
# Capybara.register_driver :selenium_chrome do |app|
# Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
Capybara.default_driver = :selenium
Capybara.default_wait_time = 5
Capybara.configure do |config|
  #config.javascript_driver = :selenium
  config.javascript_driver = :poltergeist
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

# REMOTE WORKING 2
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :remote, :url => "http://thanhnguyen.local:4444/wd/hub", :desired_capabilities => :firefox)
# end
##