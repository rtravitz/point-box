require 'rails_helper'

describe "When users visit the home page" do
  scenario "they can login to their account" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    login_actions(user)

    expect(page).to have_content "Hi, #{user.name}!"
  end

  scenario "they must try again if the information doesn't match" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    visit "/"
    click_link "Login"
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "wrongpass"
    click_button "Login"

    expect(page).to have_content("Incorrect login information. Please try again.")
  end
end
