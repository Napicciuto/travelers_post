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

end

