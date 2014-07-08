require 'rails_helper'

feature 'User signs up for account' do
  scenario 'successfully' do
    visit root_path

    click_link "Sign up"
    fill_in "Username", with: "devin"
    fill_in "Email", with: "devin@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Logged in as devin"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'unsuccessfully due to required fields being blank' do
    visit root_path

    click_link "Sign up"
    click_button "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
