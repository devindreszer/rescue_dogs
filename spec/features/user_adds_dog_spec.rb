require 'rails_helper'

feature 'User adds dog and views its info' do
  scenario 'by clicking plus from random dog page' do
    visit root_path
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    click_link "Plus"

    expect(page).to have_css ".name"
    expect(page).to have_css ".age"
    expect(page).to have_css ".size"
    expect(page).to have_css ".gender"
    expect(page).to have_css ".image"
    expect(page).to have_css ".description"
  end
end
