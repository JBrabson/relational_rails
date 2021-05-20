require "rails_helper"

RSpec.describe "As a visitor"
describe "When I visit any page" do

  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Welcome page
  it "displays link to the Welcome page" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)

      visit "/automobiles"
      expect(page).to have_link("Back to Home")
      click_link "Back to Home"
      expect(current_path).to eq("/")

      visit "/automobiles/#{raptor.id}"
      expect(page).to have_link("Back to Home")
      click_link "Back to Home"
      expect(current_path).to eq("/")

      visit "//#{dealership_1.id}/automobiles"
      expect(page).to have_link("Back to Home")
      click_link "Back to Home"
      expect(current_path).to eq("/")

      visit "//#{dealership_1.id}/automobiles/#{raptor.id}"
      expect(page).to have_link("Back to Home")
      click_link "Back to Home"
      expect(current_path).to eq("/")
  end
end
