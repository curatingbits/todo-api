# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  describe "GET #create" do
    it "creates new user" do
     expect {
      let(:user) {create(:user)}
     }.to change(User, :count).by(1)
    end
  end
end
