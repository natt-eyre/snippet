require "rails_helper"

feature "Guest views the requested snip" do
  scenario "successfully" do
    language = create(:language, lang: "text")
    snip = create(:snip, content: "text", language: language)

    visit snip_path(snip)
    expect(page).to have_content("text")
  end
end
