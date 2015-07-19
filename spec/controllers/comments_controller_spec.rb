require "rails_helper"

describe CommentsController do
  describe "#create" do
    it "creates comments for current snip" do
      user = create(:user)
      snip = create(:snip, user: user)

      sign_in_as user
      post :create, { snip_id: snip, comment: { title: "", comment: "test"} }

      expect(snip.comments.count).to eq(1)
      expect(snip.comments.last.comment). to eq("test")
    end

    it "creates comments for current user" do
      user = create(:user)
      snip = create(:snip, user: user)

      sign_in_as user
      post :create, { snip_id: snip, comment: { title: "", comment: "test"} }

      expect(Comment.last.user).to eq(user)
    end
  end
end
