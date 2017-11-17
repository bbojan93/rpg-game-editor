require 'rails_helper'

feature "signing up" do

  scenario "visiting the site to sign up" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "example"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Hi, example")
    expect(page).to have_content("Create New Character")
  end
end
