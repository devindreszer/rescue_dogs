# require 'rails_helper'

# feature 'Signed in user removes a dog matches' do
#   scenario 'by clicking remove from a dog match' do
#     devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
#     visit root_path
#     sign_in_as(devin)
#     fill_in "Enter Zip Code", with: "02093"
#     click_button "Search"
#     click_link "Match"
#     click_link "Matches"

#     first(".dog-list").click_link("Remove")

#     expect(page).to have_content "Matches"
#   end
# end
