require "rails_helper"

RSpec.describe Comment, type: :model do
  context "for validation for attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:comment) }
    it { should_not validate_presence_of(:email) }
  end

  context "return gravatar image" do
    it "returns correct image" do
      comment = FactoryGirl.create(:comment)
      expect(comment.gravatar_image).to_not be_nil
    end

    it "does not return image" do
      comment = FactoryGirl.create(:comment, email: "")
      expect(comment.gravatar_image).to eq("")
    end
  end

  context "count comments" do
    FactoryGirl.create_list(:comment, 5)
    it "returns number of comments" do
      Comment.comment_count.should be > 0
    end
  end
end

