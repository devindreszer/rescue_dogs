require 'rails_helper'

feature 'Signed in user can favorite a dog' do
  scenario 'by clicking favorite on a dog match' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Plus"
    click_link "Dog Matches"

    first(".dog-list").click_link("Favorite")

    expect(page).to have_content "Favorited"
  end
end
