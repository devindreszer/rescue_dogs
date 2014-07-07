require 'rails_helper'

feature 'User views random dog in their area' do
  scenario 'by entering a zip code on the homepage' do
    visit root_path

    fill_in "Enter Zip Code", with: '02093'
    click_button "Search"

    expect(page).to have_css "img"
  end
end
