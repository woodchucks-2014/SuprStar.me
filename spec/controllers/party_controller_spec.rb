require 'rails_helper'

RSpec.describe PartyController, :type => :controller do

  let!(:party) { Party.create(hash_tag: "#hash_tag") }
  let!(:queue) { :party.queue }

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

  describe "POST #retrieve_video_id" do
    it "should assign party as @party" do
      post :retrieve_video_id
      expect(assigns(:party).hash_tag).to eq("#hash_tag")
    end
  end

  describe "POST #retrieve_queue" do
    it "should return the queue for the party" do
      post :retrieve_queue
      expect(assigns)
    end
  end
end
