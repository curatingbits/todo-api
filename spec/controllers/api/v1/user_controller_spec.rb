require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "POST #create" do
    let(:user) {create :user}
    let(:params) {FactoryBot.attributes_for(:user)}
    subject(:action) { post :create, params: params }

    it "creates new user" do
      expect{action}.to change(User, :count).by(1)
    end

    it "returns a HTTP 200 (success) status" do
      expect(action).to have_http_status :success
    end

    context "with invalid attributes" do
      let(:params) { { email: "", password: "", password_confirmation: "" } }

      it "throws error" do
        expect { action }.to raise_error(NameError)
      end

    end
  end

  describe "POST #login" do
    let(:user) {create(:user, :token => "Token 123")}
    let(:params) {{:Authorization => "Token 123"} }
    subject(:action) {p post :signin, params: params }

    it "logs in user" do
    expect(response).to have_http_status(:success)
    end


  end

end
