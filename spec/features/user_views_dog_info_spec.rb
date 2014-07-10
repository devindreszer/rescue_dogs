require 'rails_helper'

feature 'User views dogs info' do
  scenario 'by clicking plus from random dog page' do
    visit root_path
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"

    click_link "Match"

    # Testing without API
    # petfinder_shelter_id = "TN221"
    # shelter = Shelter.create(
    #   petfinder_id: petfinder_shelter_id,
    #   url: "https://www.petfinder.com/shelters/#{petfinder_shelter_id}"
    # )

    # shelter.create_address(
    #   city: "Norfolk",
    #   state: "MA",
    #   shelter_id: shelter.id
    # )

    # dog_id = "29544302"
    # shelter.dogs.create(
    #   petfinder_id: dog_id,
    #   url: "https://www.petfinder.com/petdetail/#{dog_id}",
    #   shelter_id: shelter.id
    # )

    # shelter.save

    # visit dog_path("1")

    expect(page).to have_css ".name"
    expect(page).to have_css ".age"
    expect(page).to have_css ".size"
    expect(page).to have_css ".gender"
    expect(page).to have_css ".image"
    expect(page).to have_css ".description"
    expect(page).to have_css ".shelter-name"
    expect(page).to have_css ".shelter-location"
  end

  scenario 'by clicking on a dog in their dog matches' do
    devin = create(:user, username: "devin", email: "devin@example.com", password: "password")
    visit root_path
    sign_in_as(devin)
    fill_in "Enter Zip Code", with: "02093"
    click_button "Search"
    click_link "Match"
    click_link "Matches"

    first(".dog-list").first(:link).click

    expect(page).to have_css ".name"
    expect(page).to have_css ".age"
    expect(page).to have_css ".size"
    expect(page).to have_css ".gender"
    expect(page).to have_css ".image"
    expect(page).to have_css ".description"
    expect(page).to have_css ".shelter-name"
    expect(page).to have_css ".shelter-location"
  end
end
