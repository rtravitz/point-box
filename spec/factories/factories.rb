FactoryGirl.define do
  
  sequence :name do |n|
    "User#{n}"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name
    email
    password "password"
  end

  sequence :cost do |n|
    "n"
  end

  sequence :reward_name do |n|
    "Reward #{n}"
  end

  factory :reward do
    name {generate(:reward_name)}
    cost
    image_link "http://media.tumblr.com/ca2a1150e559f1dab169f2b833df2d91/tumblr_inline_muslvmje1X1s8ujex.jpg"
  end
end
