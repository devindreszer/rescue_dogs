require 'rails_helper'

feature 'User views random dog in their area' do
  scenario 'by entering a zip code on the homepage' do
    visit root_path

    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    expect(page).to have_css "img"
  end

  scenario 'by clicking next from random dog page' do
    visit root_path
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    click_link "Flip"

    expect(page).to have_css "img"
  end

  scenario 'by clicking back from dog detail page' do
    visit root_path
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"

    click_link "Back"

    expect(page).to have_css "img"
  end
end
