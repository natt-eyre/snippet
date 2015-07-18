require "rails_helper"

feature "User comments" do
  scenario "on his own snip" do
    user = create(:user)
    snip = create(:snip, user: user)

    visit snip_path(snip, as: user)
    
    fill_in Comment.human_attribute_name("comment"), with: "I'm first!"
    click_on t("comments.new.post")

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("I'm first!")
  end
end
