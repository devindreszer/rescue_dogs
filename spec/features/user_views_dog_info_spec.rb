require 'rails_helper'

feature 'User views dogs info' do
  background do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
  end
  scenario 'by clicking plus from random dog page' do

    click_link "Match"

    expect(page).to have_css ".card"
    expect(page).to have_css ".description"
  end

  scenario 'by clicking on a dog in their dog matches' do
    click_link "Match"
    click_link "Matches"

    first(".dog-list").first(:link).click

    expect(page).to have_css ".card"
    expect(page).to have_css ".description"
  end
end
