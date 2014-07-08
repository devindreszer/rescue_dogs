require 'rails_helper'

feature 'Signed in user tracks dog matches' do
  scenario 'by clicking on dog matches in navbar' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)

    click_link "Dog Matches"

    expect(page).to have_content "Dog Matches"
  end
end
