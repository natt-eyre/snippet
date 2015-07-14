require "rails_helper"

describe SnipsController do
  describe "#index" do
    it "shows only snips of current user" do
      our_user = create(:user)
      our_snip = create(:snip, user: our_user, name: "our snip")
      foreign_user = create(:user)
      foreign_snip = create(:snip, user: foreign_user, name: "foreign snip")

      sign_in_as our_user
      get :index

      expect(assigns(:snips).map(&:name)).to eq ["our snip"]
    end
  end
end
