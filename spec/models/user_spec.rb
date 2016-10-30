require 'rails_helper'

describe "User" do
  context "validations" do
    it "is invalid without a name" do
      user = User.new(email: "test1", password: "pass")
      expect(user).to be_invalid
    end

    it "is invalid without an email" do
      user = User.new(name: "test1", password: "pass")
      expect(user).to be_invalid
    end

    it "is invalid without a password" do
      user = User.new(name: "test1", email: "email")
      expect(user).to be_invalid
    end

    it "is valid with a name, email, and password" do
      user = User.new(name: "test1", email: "email", password: "pass")
      expect(user).to be_valid
    end
  end  

  context "relationships" do
    it "has many rewards" do
      user = User.new
      expect(user).to respond_to(:rewards)
    end
  end
end

describe ".unowned_rewards" do
  it "returns the unowed rewards" do
    user = User.new(name: "test1", email: "email", password: "pass")
    reward1, reward2, reward3, reward4 = create_list(:reward, 4)
    user.rewards << reward1
    user.rewards << reward2

    result = user.unowned_rewards

    expect(result.count).to eq(2)
  end
end
