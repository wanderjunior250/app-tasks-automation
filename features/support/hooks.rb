require 'capybara/dsl'

Before do |scenario|
  @env = ENV['env']
end

AfterConfiguration do |config|
  Dir.mkdir('reports') unless Dir.exist?('reports')
end

After do |scenario|
  if page.driver.browser.window_handles.count > 1
    puts page.driver.browser.window_handles.count
    page.driver.browser.close
    last_handle = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(last_handle)
  end
end
