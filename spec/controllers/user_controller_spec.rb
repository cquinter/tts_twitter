require 'rails_helper'

describe UserController do
  let(:user) { build(:user) }

  before :each do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  # describe 'profile' do
  #   it "assigns current user correctly" do
  #     allow(controller).to receive(:current_user).and_return(user)
  #     get :profile
  #     expect(assigns[:user]).to eq(user)
  #   end
  #
  #   it "assigns a new tweet for the form" do
  #     allow(controller).to receive(:current_user).and_return(user)
  #     get :profile
  #     expect(assigns[:tweet]).to be_new_record
  #   end
  #
  #   it "assigns tweets for current user and their followers" do
  #     allow(Tweet).to receive(:where).and_return(:tweets)
  #     allow(controller).to receive(:current_user).and_return(user)
  #     get :profile
  #     expect(assigns[:tweets]).to eq(:tweets)
  #   end
  #
  #   it "renders the profile view" do
  #     allow(controller).to receive(:current_user).and_return(user)
  #     get :profile
  #     expect(response).to render_template("profile")
  #   end
  # end

  describe 'show' do
    it "finds the user" do
      id = "some key"
      allow(User).to receive(:find).with(id).and_return(user)
      get :show, params: { id: id }
      expect(assigns[:user]).to eq(user)
    end
  end
end
