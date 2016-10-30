require 'rails_helper'

describe "Reward" do
  context "relationships" do
    it "has many users" do
      reward = Reward.new
      expect(reward).to respond_to(:users)
    end
  end
end

