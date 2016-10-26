require 'rails_helper'

feature "User visits their dashboard" do
  scenario "they can see their current total points and redeemed points" do
    user = create(:user)
    login_actions(user)
    
    expect(page).to have_content("Current points: 0")
    expect(page).to have_content("Redeemed points: 0")
  end
end
