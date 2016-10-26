require 'rails_helper'

feature "When an admin is logged in" do
  scenario "they can create a new reward" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password", admin: true)
    login_actions(user)
    
    click_link("Add Reward")
    fill_in "reward_name", with: "Archer"
    fill_in "reward_cost", with: 10
    fill_in "reward_image_link", with: "http://media.tumblr.com/ca2a1150e559f1dab169f2b833df2d91/tumblr_inline_muslvmje1X1s8ujex.jpg"
    click_button("Create Reward")

    expect(page).to have_content("Archer - 10")
  end
end
