require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"

describe "Walmyr's website" do
  it "scrolls to footer, clicks twitter icon, goes to 2nd tab and comes back, then goes to the top by clicking the header" do
    my_website_url = "https://walmyr-filho.com/"

    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to my_website_url

    youtube_social_icon = driver.find_element(css: 'img[alt="YouTube"]')
    driver.action.move_to(youtube_social_icon).perform
    youtube_social_icon.click

    driver.switch_to.window(driver.window_handles[1])

    expect(driver.current_url).to eq("https://www.youtube.com/user/wlsf82/videos")

    driver.switch_to.window(driver.window_handles[0])

    expect(driver.current_url).to eq(my_website_url)

    driver.find_element(css: 'h1').click
    driver.quit
  end
end
