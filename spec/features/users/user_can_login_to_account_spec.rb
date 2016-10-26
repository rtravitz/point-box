require 'rails_helper'

describe "When users visit the home page" do
  scenario "they can login to their account" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    visit "/"
    click_link "Login"
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password_digest
    click_button "Login"

    expect(page).to have_content "Hi, #{user.name}!"
    
  end
end
