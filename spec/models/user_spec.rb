require 'rails_helper'
describe User do
  describe '#create' do

    it "ユーザー情報をすべて入力しているかどうか" do
      user= build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = bulid(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("does not match password ")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

  end
end
