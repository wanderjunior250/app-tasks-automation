require 'rspec'
require 'yaml'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'pry'

include Capybara::DSL
include RSpec::Matchers

ENVIRONMENT = (YAML.load_file('./features/config/environment.yml'))
MASS = (YAML.load_file('./features/fixtures/mass.yml'))
CONFIG = (YAML.load_file('./features/config/config.yml'))

Capybara.register_driver :remote do |app|
  Capybara::Selenium::Driver.new(app, :browser => CONFIG['browser'], url: CONFIG['url'])
end

Capybara.register_driver :chrome do |app|
	#options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu])
	#Selenium::WebDriver::Chrome.driver_path = './drivers/chromedriver'
	Capybara::Selenium::Driver.new(app, browser: :chrome)#, options: options)
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :internet_explorer do |app|
  Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
end
 
Capybara.configure do |config|
  driver = CONFIG['browser']
  CONFIG['remote'] = ENV['remote'] if ENV['remote']
  if CONFIG['remote']
    Capybara.server_port = CONFIG['server_port']
    Capybara.server_host = CONFIG['server_host']
    Capybara.app_host = "#{Capybara.server_host}:#{Capybara.server_port}"
    driver = :remote
  end
  Capybara.current_driver = driver
  Capybara.javascript_driver = driver
  config.default_max_wait_time = CONFIG['default_max_wait_time']
  Capybara.page.driver.browser.manage.window.maximize if driver == :chrome
end