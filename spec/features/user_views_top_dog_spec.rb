require 'rails_helper'

feature 'Signed in user can view top dog' do
  scenario 'by Top Dog in navbar' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"
    click_link "Matches"
    first(".tagging").click_link("Favorite")
    click_link "Favorites"
    first(".tagging").click_link("add-crown")

    click_link "Top Dog"

    expect(page).to have_content "Top Dog"
  end
end
