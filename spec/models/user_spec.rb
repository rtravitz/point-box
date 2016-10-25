require 'rails_helper'

describe "User" do
  context "validations" do
    it "is invalid without a name" do
      user = User.new(email: "test1", password_digest: "pass")
      expect(user).to be_invalid
    end

    it "is invalid without an email" do
      user = User.new(name: "test1", password_digest: "pass")
      expect(user).to be_invalid
    end

    it "is invalid without a password_digest" do
      user = User.new(name: "test1", email: "email")
      expect(user).to be_invalid
    end

    it "is valid with a name, email, and password" do
      user = User.new(name: "test1", email: "email", password_digest: "pass")
      expect(user).to be_valid
    end
  end  
end
