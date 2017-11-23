require "rails_helper"

feature "creating new attribute" do
  let(:user) {FactoryGirl.create(:user)}
  let(:character) {FactoryGirl.create(:character, user_id: user.id)}

  scenario "user creates new attribute for character" do
    visit root_path
    click_link 'Log in'
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"

    visit character_path(character.id)
    attach_file "Icon", Rails.root + "spec/fixtures/icon.png"
    fill_in "Attribute name", with: "Stamina"
    fill_in "Attribute value", with: 80
    click_button "Create Character attribute"

    expect(page.find("#attributes")).to have_content("Stamina")
  end
end
