require 'rails_helper'

RSpec.feature "Characters", type: :feature do

  scenario "user creates new character" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect {
      click_link "Create New Character"
      select "Mage", from: "Name"
      attach_file "Avatar", Rails.root + "spec/fixtures/avatar.png"
      click_button "Create Character"
    }.to change(user.characters, :count).by(1)

    expect(page).to have_content "You successfully created a new character"
    expect(page).to have_content "#{user.username}'s Mage"
  end


end
