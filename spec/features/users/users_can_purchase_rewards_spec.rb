require 'rails_helper'

feature "User visits their dashboard" do
  scenario "they can purchase a reward" do
    user = User.create(name: "test", email: "test@example.com", password: "pass", points: 50)
    reward1 = create(:reward)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_link("Buy")

    within "div#user_rewards" do
      expect(page).to have_content reward1.name
    end

    within "div#all_rewards" do
      expect(page).to_not have_content reward1.name
    end
  end
end
