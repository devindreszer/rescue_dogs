require 'rails_helper'

feature 'User views random dog in their area' do
  scenario 'by entering a zip code on the homepage' do
    visit root_path

    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    expect(page).to have_css ".random-dog-container"
  end

  scenario 'by clicking next from random dog page' do
    visit root_path
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    click_link "Flip"

    expect(page).to have_css ".random-dog-container"
  end

  scenario 'by clicking back from dog detail page' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"

    click_link "Other Dogs in the Area"

    expect(page).to have_css ".random-dog-container"
  end
end
