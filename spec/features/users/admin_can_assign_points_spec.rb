require 'rails_helper'

feature "Admins can assign points" do
  scenario "the points appear on a user's page" do
    user1, user2 = create_list(:user, 2)
    user1.update(admin: true)
    login_actions(user1)

    select(user2.email, from: 'select_box')
    fill_in "user_points", with: 50
    click_button("Submit")

    click_link "Logout"
    login_actions(user2)

    expect(page).to have_content("Current points: 50")
  end
end
