require 'rails_helper'

feature 'Signed in user views favorites' do
  scenario 'by clicking favorites from navbar' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"
    click_link "Matches"
    first(".dog-list").click_link("Favorite")

    click_link "Favorites"

    expect(page).to have_content "Favorites"
  end
end
