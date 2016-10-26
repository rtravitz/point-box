require 'rails_helper'

describe "User clicks the logout button" do
  scenario "the user is logged out" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    visit "/"
    click_link "Login"
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Login"

    click_link "Logout"

    expect(page).to have_content("Successfully logged out!")
  end
end
