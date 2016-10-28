require 'rails_helper'

describe "User visits dashboard" do
  scenario "they can see all possible rewards" do
    user = User.create(name: "Ryan", email: "rtravitz@gmail.com", password: "password")
    reward1, reward2, reward3 = create_list(:reward, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) 

    visit user_path(user)
    
    expect(page).to have_content("#{reward1.name} - #{reward1.cost}")
    expect(page).to have_content("#{reward2.name} - #{reward2.cost}")
    expect(page).to have_content("#{reward3.name} - #{reward3.cost}")
  end
end
