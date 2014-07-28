require 'rails_helper'

RSpec.describe NotificationController, :type => :controller do

  describe "GET index" do
    it "should returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "should returns http success" do
      get :show
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "should create a new party"
    it "should"
  end


end
