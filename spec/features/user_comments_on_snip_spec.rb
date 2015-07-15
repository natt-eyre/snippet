require "rails_helper"

feature "User comments" do
  scenario "on his own snip" do
    user = create(:user)
    snip = create(:snip, user: user)

    visit snip_path(snip, as: user)
    click_on "Add comment"
    
    fill_in "Title", with: "first"
    fill_in "Comment", with: "I'm first!"
    click_on "Post it!"

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("I'm first!")
  end
end
