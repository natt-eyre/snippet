require "rails_helper"

feature "Guest comments on snip" do
  scenario "successfully" do
    language = create(:language, lang: "text")
    user = create(:user)
    snip = create(:snip, user: user, language: language)

    visit snip_path(snip)
    comment text: "I'm first!"

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("I'm first!")
  end

  def comment(text:)
    fill_in Comment.human_attribute_name("comment"), with: text
    click_on t("comments.new.post")
  end
end
