require "rails_helper"

feature "User creates a snip" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_on "New Snip"
    fill_in "Name", with: "S1"
    fill_in "Content", with: "test"
    click_on "Create a snip"

    expect(page.current_path).to eq(snips_path)
    expect(page).to have_content("S1")
  end
end
