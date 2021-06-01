require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it "should create a new user with all the fields filled in" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_valid
    end

    it "should not save user if password is missing" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: nil,
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should not save user if confirmation password is wrong" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "derp"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should not save user if name is missing" do
      @user = User.new(
        name: nil,
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end


    it "should not save user if email is missing" do
      @user = User.new(
        name: "Rick",
        email: nil,
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should not save if password is less than 6 characters" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "derp",
        password_confirmation: "derp"
      )
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to_not be_empty
    end
  end

  ############### CREDENTIAL AUTHENTICATIONS #################

  describe '.authenticate_with_credentials' do
    it "should return true when email and password match" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      @test = User.authenticate_with_credentials("rick@sanchez.ca", "wubbalubbadubdub")
      expect(@test).to be_truthy
    end

    it "should fail if the password is wrong" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      @test = User.authenticate_with_credentials("rick@sanchez.ca", "herpderp")
      expect(@test).to be_falsey
    end

    it "should fail if the email is wrong" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      @test = User.authenticate_with_credentials("rick@pickle.ca", "wubbalubbadubdub")
      expect(@test).to be_falsey
    end

    it "should return true when email is of different cases" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      @test = User.authenticate_with_credentials("rIck@saNCHez.ca", "wubbalubbadubdub")
      expect(@test).to be_truthy
    end

    it "should return true when email has leading or ending spaces" do
      @user = User.new(
        name: "Rick",
        email: "rick@sanchez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      @user.save
      @test = User.authenticate_with_credentials("  rIck@saNCHez.ca   ", "wubbalubbadubdub")
      expect(@test).to be_truthy
    end

  
  end

end
