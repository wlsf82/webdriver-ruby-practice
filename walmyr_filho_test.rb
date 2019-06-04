require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"

describe "Walmyr's website" do
  it "scrolls to footer, clicks twitter icon, goes to 2nd tab and comes back, then goes to the top by clicking the header" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "http://walmyr-filho-react.herokuapp.com/"

    # Sleeping just for the fun of watching the test run.
    sleep 1

    youtube_social_icon = driver.find_element(css: 'img[alt="YouTube"]')
    driver.action.move_to(youtube_social_icon).perform

    # Sleeping just for the fun of watching the test run.
    sleep 1

    youtube_social_icon.click

    # Sleeping just for the fun of watching the test run.
    sleep 1

    driver.switch_to.window(driver.window_handles[1])

    # Sleeping just for the fun of watching the test run.
    sleep 1

    driver.switch_to.window(driver.window_handles[0])

    # Sleeping just for the fun of watching the test run.
    sleep 1

    header = driver.find_element(css: 'h1')
    header.click

    # Sleeping just for the fun of watching the test run.
    sleep 1

    driver.quit
  end
end
