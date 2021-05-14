require "rails_helper"

RSpec.describe "As a visitor"
describe "When I visit an Auto Dealership show page" do

  # User Story 2, Parent Show
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it "it displays only that Auto Dealership and its attributes" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit "/auto_dealerships/#{dealership_1.id}"
    expect(page).to have_content(dealership_1.name)
    expect(page).to have_content(dealership_1.preowned_sales)
    expect(page).to have_content(dealership_1.foreign_inventory)
    expect(page).to_not have_content(dealership_2.name)

    visit "/auto_dealerships/#{dealership_2.id}"
    expect(page).to have_content(dealership_2.name)
    expect(page).to have_content(dealership_2.preowned_sales)
    expect(page).to have_content(dealership_2.foreign_inventory)
    expect(page).to_not have_content(dealership_1.name)
  end

  # User Story 7, Parent Child Count
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it "it displays number of vehicles associated with that Auto Dealership" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
    fusion = dealership_1.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
      engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

    visit "/auto_dealerships/#{dealership_1.id}"
    expect(page).to have_content("Vehicles Available at this Location (2)")

  end
end
