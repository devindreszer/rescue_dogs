require 'rails_helper'

feature 'User logs into account' do
  background do
    create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
  end

  scenario 'successfully' do

    click_link "Login"
    fill_in 'Email', with: "devin@example.com"
    fill_in 'Password', with: "password"
    click_button 'Sign in'

    expect(page).to have_content "devin"
    expect(page).to have_content "Signed in successfully"

  end

  scenario 'unsuccessfully due to required fields being blank' do

    click_link "Login"
    click_button 'Sign in'

    expect(page).to have_content "Invalid email or password"

  end
end
