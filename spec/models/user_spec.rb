require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it "should create a new user with all the fields filled in" do
      @user = User.new(
        name: "Rick",
        email: "rick@dsancez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_valid
    end

    it "should not save user if password is missing" do
      @user = User.new(
        name: "Rick",
        email: "rick@dsancez.ca",
        password: nil,
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end


  end

end
