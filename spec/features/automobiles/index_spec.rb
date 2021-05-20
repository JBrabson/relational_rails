require "rails_helper"

RSpec.describe "As a visitor"
describe "When I visit the Automobiles index page" do

  # User Story 3
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it "it displays all Automobiles and their attributes" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: true, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
      #preowned boolean changed to true to allow for user story 15 spec to pass; only preowned vehicles to be displayed
    fusion = dealership_1.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
      engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")
    gx460 = dealership_2.automobiles.create!(preowned: true, year: 2021, make: 'Lexus', model: 'GX 460', color: 'Atomic Silver', automatic: true,
      engine: 'Gasoline', horsepower: 301, cylinders: 8, drive_train: '4WD', price: 53450, seating_capacity: 5)
      #preowned boolean changed to true to allow for user story 15 spec to pass; only preowned vehicles to be displayed
    nx300 = dealership_2.automobiles.create!(preowned: true, year: 2021, make: 'Lexus', model: 'NX 300', color: 'Atomic Silver', automatic: true,
      engine: 'Gasoline', horsepower: 235, cylinders: 4, drive_train: 'AWD', price: 37610, seating_capacity: 5)

    visit "/automobiles"
    expect(page).to have_content(raptor.model)
    expect(page).to have_content(raptor.year)
    expect(page).to have_content(fusion.model)
    expect(page).to have_content(fusion.year)
    expect(page).to have_content(gx460.model)
    expect(page).to have_content(gx460.year)
    expect(page).to have_content(nx300.model)
    expect(page).to have_content(nx300.year)
  end

# User Story 15, Child Index only shows `true` Records
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
  it "I only see records where the preowned option is true " do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
    fusion = dealership_1.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
      engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

    visit "/automobiles"
    expect(page).to have_content("2020 Ford Fusion")
    expect(page).to_not have_content("2022 Ford F-150 Raptor")
  end
end

describe "When I visit any page" do

  # User Story 8, Child Index Link
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "displays link to Automobiles index page" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
      engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)

      visit "/auto_dealerships"
      expect(page).to have_link("All Automobiles")
      click_link "All Automobiles"
      expect(current_path).to eq("/automobiles")

      visit "/auto_dealerships/#{dealership_1.id}"
      expect(page).to have_link("All Automobiles")
      click_link "All Automobiles"
      expect(current_path).to eq("/automobiles")

      visit "/auto_dealerships/#{dealership_1.id}/automobiles"
      expect(page).to have_link("All Automobiles")
      click_link "All Automobiles"
      expect(current_path).to eq("/automobiles")

      visit "/automobiles/#{raptor.id}"
      expect(page).to have_link("All Automobiles")
      click_link "All Automobiles"
      expect(current_path).to eq("/automobiles")
  end
end
