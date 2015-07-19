require "rails_helper"

feature "User updates his snip" do
  scenario "succesfully" do
    user = create(:user)
    snip = create(:snip, user: user, name: "s1", content: "text")
    visit snips_path(as: user)
    click_on snip.name

    click_button "Edit"
    fill_in Snip.human_attribute_name("name"), with: "edited"
    click_on "Save changes"

    expect(page.current_path).to eq(snip_path(snip))
    expect(page).to have_content("edited")
  end
end
