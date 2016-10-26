require 'rails_helper'

describe "User clicks the logout button" do
  scenario "the user is logged out" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    login_actions(user)

    click_link "Logout"

    expect(page).to have_content("Successfully logged out!")
  end
end
