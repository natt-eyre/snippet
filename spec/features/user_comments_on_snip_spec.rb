require "rails_helper"

feature "User comments" do
  scenario "on their own snip" do
    language = create(:language, lang: "text")
    user = create(:user)
    snip = create(:snip, user: user, language: language)

    visit snip_path(snip, as: user)
    comment text: "I'm first!"

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("I'm first!")
  end

  scenario "on the snip of another user" do
    language = create(:language, lang: "text")
    our_user = create(:user)
    other_user = create(:user)
    snip = create(:snip, user: other_user, language: language)

    visit snip_path(snip, as: our_user)
    comment text: "I'm first!"

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("I'm first!")
  end

  def comment(text:)
    fill_in Comment.human_attribute_name("comment"), with: text
    click_on t("comments.new.post")
  end
end
