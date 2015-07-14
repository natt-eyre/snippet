require "rails_helper"

feature "User creates a snip" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_on t("snips.index.add")
    fill_in Snip.human_attribute_name("name"), with: "S1"
    fill_in Snip.human_attribute_name("content"), with: "test"
    click_on t("snips.new.add")

    expect(page.current_path).to eq(snips_path)
    expect(page).to have_content("S1")
  end
end
