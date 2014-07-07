require 'rails_helper'

feature 'User views app features' do
  scenario 'on the homepage' do
    visit root_path

    expect(page).to have_content "Browse rescue dogs in your area"
  end
end
