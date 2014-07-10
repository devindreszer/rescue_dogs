require 'rails_helper'

feature 'Signed in user can crown top dog' do
  background do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"
    click_link "Matches"
    first(".tagging").click_link("Favorite")
    click_link "Favorites"
  end

  scenario 'by clicking add-crown on a dog match card' do
    first(".tagging").click_link("add-crown")

    expect(page).to have_css ".remove-crown"
  end
end
