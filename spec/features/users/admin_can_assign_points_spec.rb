require 'rails_helper'

feature "Admins can assign points" do
  context "as an admin" do
    scenario "the points appear on a user's page" do
      pending
      admin = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password", role: 1)
      user = User.create(name: "test", email: "test@example.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_user_path(admin)
      click_link("Assign Points")
      fill_in "points", with: 50
      select "test@example.com", from: 'user'
      click_button ("Assign")
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)

      expect(page).to have_content "Current points: 50"
    end
  end
end
