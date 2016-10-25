require 'rails_helper'

describe "When users visit the home page" do
  scenario "they can create an account" do
    visit "/"
    click_link "Create Account"
    fill_in "user_name", with: "Ryan"
    fill_in "user_email", with: "rtravitz@gmail.com"
    fill_in "user_password_digest", with: "password"
    click_button "Create Account"

    expect(page).to have_content "Hi, Ryan!"
  end
end
