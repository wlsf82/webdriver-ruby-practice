require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"

describe "Walmyr's website" do
  it "scrolls to footer, clicks twitter icon, goes to 2nd tab and comes back, then goes to the top by clicking the header" do
    my_website_url = "https://walmyr-filho.com/"

    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to my_website_url

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

    expect(driver.current_url).to eq("https://www.youtube.com/user/wlsf82/videos")

    # Sleeping just for the fun of watching the test run.
    sleep 1

    driver.switch_to.window(driver.window_handles[0])

    expect(driver.current_url).to eq(my_website_url)

    # Sleeping just for the fun of watching the test run.
    sleep 1

    header = driver.find_element(css: 'h1')
    header.click

    # Sleeping just for the fun of watching the test run.
    sleep 1

    driver.quit
  end
end
