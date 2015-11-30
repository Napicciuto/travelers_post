require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do

    let(:comments) { comments = FactoryGirl.create(:comment) }
    
    it "returns status code of 200" do
      get :index
      expect(response).to be_success
      expect(get: "/comments").to be_routable
      expect(response).to have_http_status(200)
    end

    it "render index" do
      get :index
      expect(response).to render_template("index")
    end

    it "load all the comments" do
      get :index
      expect(comments).to_not be_nil
    end
  end

  describe "POST create" do
    it "creates a new comment" do
      comment = FactoryGirl.attributes_for(:comment)
      expect{ post :create, comment: comment }.to change(Comment, :count).by(1)
    end

    it "creates a new comment without email" do
      comment = FactoryGirl.attributes_for(:comment, email: "")
      expect{ post :create, comment: comment }.to change(Comment, :count).by(1)
    end

    it "does not save the new comment without name" do
      comment = FactoryGirl.attributes_for(:comment, name: "")
      expect{ post :create, comment: comment }.to_not change(Comment, :count)
    end

    it "does not save the new comment without comment" do
      comment = FactoryGirl.attributes_for(:comment, comment: "")
      expect{ post :create, comment: comment }.to_not change(Comment, :count)
    end

    it "does not save the new comment without a valid email" do
      comment = FactoryGirl.attributes_for(:comment, email: "bademail")
      expect{ post :create, comment: comment }.to_not change(Comment, :count)
    end
  end

end

