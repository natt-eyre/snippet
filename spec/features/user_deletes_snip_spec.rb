require "rails_helper"

feature "User deletes his snip" do
  scenario "successfully" do
    user = create(:user)
    snip = create(:snip, user: user, name: "s1")
    visit snips_path(as: user)

    click_link "Delete"

    expect(page.current_path).to eq(snips_path)
    expect(page).not_to have_content("s1")
  end
end
