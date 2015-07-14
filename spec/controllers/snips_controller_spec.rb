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

  describe "#create" do
    it "creates snips for current user" do
      user = create(:user)

      sign_in_as user
      post :create, snip: { name: "Snip", content: "test" }

      expect(Snip.last.user).to eq(user)
    end
  end

  describe "#show" do
    context "snip belongs to current user" do
      it "shows the requested snip" do
        user = create(:user)
        snip = create(:snip, user: user, name: "snip_name")

        sign_in_as user
        get :show, id: snip.id

        expect(assigns(:snip).name).to eq "snip_name"
      end
    end

    context "snip belongs to other user" do
      it "shows the requested snip" do
        our_user = create(:user)
        other_user = create(:user)
        snip = create(:snip, user: other_user, name: "snip_name")

        sign_in_as our_user
        get :show, id: snip.id

        expect(assigns(:snip).name).to eq "snip_name"
      end
    end
  end
end
