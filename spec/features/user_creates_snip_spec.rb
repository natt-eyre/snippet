require "rails_helper"

feature "User creates a snip" do
  scenario "with text" do
    submit_snip name: "S1", content: "test"

    expect(page.current_path).to eq(snips_path)
    expect(page).to have_content("S1")
  end

  scenario "unsuccessfully" do
    submit_snip name: "S1", content: ""

    expect(page).to have_content("can't be blank")
  end

  def submit_snip(name:, content:)
    visit root_path(as: create(:user))
    fill_in Snip.human_attribute_name("name"), with: name
    fill_in Snip.human_attribute_name("content"), with: content
    click_on t("snips.new.add")
  end
end
