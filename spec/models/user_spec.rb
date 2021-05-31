require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it "creates a new user with all the fields filled in" do
      @user = User.new(
        name: "Rick",
        email: "rick@dsancez.ca",
        password: "wubbalubbadubdub",
        password_confirmation: "wubbalubbadubdub"
      )
      expect(@user).to be_valid
    end



  end
end
