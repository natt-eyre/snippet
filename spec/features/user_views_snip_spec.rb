require "rails_helper"

feature "User views the requested snip" do
  scenario "of current user" do
    language = create(:language, lang: "text")
    user = create(:user)
    snip = create(:snip, user: user, name: "s1", content: "text", language: language)

    visit snips_path(as: user)
    click_on snip.name

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("text")
  end

  scenario "of other user" do
    language = create(:language, lang: "text")
    our_user = create(:user)
    other_user = create(:user)
    snip = create(:snip, user: other_user, content: "textie", language: language)

    visit snip_path(snip, as: our_user)
    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("textie")
  end
end
