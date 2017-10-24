require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path='/usr/local/bin/chromedriver' # would be in the initialzie method but we don't have it in this file.

# <-- Create chromedriver
 # <-- Use @driver to get the methods for Selenium. Getting all objects available through chromedriver -->
@driver = Selenium::WebDriver.for :chrome

@driver.get 'http://toolsqa.com/automation-practice-form/'
# <-- sleeps for 5 secs to allow user to see webpage load. Delay. Telling Ruby not to do anything for 5 seconds. -->
# sleep 5

# <-- Finding the first name via name element on the page -->
# <-- .displayed? will return true if the element is displayed on the screen -->
p @driver.find_element(:name, 'firstname').displayed?

# <-- will send the keys, in this case the name alison, to the textbox --> elements - will return an array, fill
# @driver.find_element(:name, 'firstname').send_keys('alison')

# @driver.find_element(:id, 'sex-1').click
# @driver.find_element(:name, 'firstname')['value'] == "kieran" --> Doesn't work

# @driver.find_element(:id, 'datepicker').send_keys('24/10/17')
#
# @driver.find_element(:id, 'tool-2').click
# @driver.find_element(:id, 'continents').selectByVisibleText("europe")
# @driver.find_element(:link_text, 'Partial Link Test').click

# dropdown = @driver.find_element(id: 'continents')
# select_list = Selenium::WebDriver::Support::Select.new(dropdown)
# select_list.select_by(:text, 'Europe')

# @driver.find_element(:link_text, 'Partial Link Test').click

@driver.find_element(id: "photo").send_keys("/Users/tech-a59/Documents/test.txt")

sleep 5
