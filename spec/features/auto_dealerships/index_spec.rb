require "rails_helper"

RSpec.describe "As a visitor"
describe "When I visit the Auto Dealerships index page" do

  # User Story 1, Parent Index
  # When I visit '/auto_dealerships'
  # Then I see the name of each parent record in the system
  it "it displays all Auto Dealerships" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit '/auto_dealerships'
    expect(page).to have_content(dealership_1.name)
    expect(page).to have_content(dealership_2.name)
  end

  # User Story 6, Parent Index
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it "it displays all Auto Dealerships and corresponding timestamp, ordered by most recently created" do
    dealership_1 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")

    visit '/auto_dealerships'
    expect(page).to have_content(dealership_1.created_at)
    expect(page).to have_content(dealership_2.created_at)
    expect("Stevinson Lexus").to appear_before("Larry H Miller", only_text: true)
  end
end

describe "When I visit any page" do

  # User Story 9, Parent Index Link
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it "displays link to Auto Dealerships index page" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)

      visit "/automobiles"
      expect(page).to have_link("All Dealerships")
      click_link "All Dealerships"
      expect(current_path).to eq("/auto_dealerships")

      visit "/automobiles/#{raptor.id}"
      expect(page).to have_link("All Dealerships")
      click_link "All Dealerships"
      expect(current_path).to eq("/auto_dealerships")

      visit "/auto_dealerships/#{dealership_1.id}/automobiles"
      expect(page).to have_link("All Dealerships")
      click_link "All Dealerships"
      expect(current_path).to eq("/auto_dealerships")

      visit "/auto_dealerships/#{dealership_1.id}/automobiles/#{raptor.id}"
      expect(page).to have_link("All Dealerships")
      click_link "All Dealerships"
      expect(current_path).to eq("/auto_dealerships")
  end
end
