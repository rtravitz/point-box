require 'rails_helper'

feature "Managing Rewards" do
  context "When an admin is logged in" do
    scenario "they can create a new reward" do
      admin = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      
      visit admin_user_path(admin)
      click_link("Add Reward")
      fill_in "reward_name", with: "Archer"
      fill_in "reward_cost", with: 10
      fill_in "reward_image_link", with: "http://media.tumblr.com/ca2a1150e559f1dab169f2b833df2d91/tumblr_inline_muslvmje1X1s8ujex.jpg"
      click_button("Create Reward")

      expect(page).to have_content("Archer - 10")
    end

    scenario "they can edit an existing reward" do
      admin = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      reward = create(:reward)

      visit admin_rewards_path
      click_link("Edit")
      fill_in "reward_name", with: "A day with Regis Philbin"
      fill_in "reward_cost", with: 25
      click_button("Update Reward")

      expect(page).to have_content("A day with Regis Philbin - 25")
    end

    scenario "they can delete an existing reward" do
      admin = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      reward = create(:reward)

      visit admin_rewards_path
      click_link("Delete")

      expect(page).to_not have_content("#{reward.name} - #{reward.cost}")
    end

    context "When a default user is logged in" do
      scenario "they cannot access the reward edit functions" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit admin_rewards_path
        expect(page).to_not have_content("All Rewards")
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
      
    end
  end
end

