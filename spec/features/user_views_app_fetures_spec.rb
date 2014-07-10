require 'rails_helper'

feature 'User views app features' do
  scenario 'on the homepage' do
    visit root_path

    expect(page).to have_content "Search"
    expect(page).to have_content "Flip"
    expect(page).to have_content "Match"
    expect(page).to have_content "Track"
    expect(page).to have_content "Favorites"
    expect(page).to have_content "Top Dog"
  end
end
