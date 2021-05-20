require 'rails_helper'

RSpec.describe "Auto Dealership's Automobile show page" do
# When I visit '/parents/:parent_id/child_table_name/:id'
# Then I see only that child and its attributes:
  describe "When I click on an Automobile from the list of Automobiles associated with Auto Dealership" do
    it "it displays only that Automobile and its attributes" do
      dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
        city: "Denver", state: "CO")
      raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
        engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
      fusion = dealership_1.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
          engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

      dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
        city: "Golden", state: "CO")
      gx460 = dealership_2.automobiles.create!(preowned: false, year: 2021, make: 'Lexus', model: 'GX 460', color: 'Atomic Silver', automatic: true,
        engine: 'Gasoline', horsepower: 301, cylinders: 8, drive_train: '4WD', price: 53450, seating_capacity: 5)
      nx300 = dealership_2.automobiles.create!(preowned: false, year: 2021, make: 'Lexus', model: 'NX 300', color: 'Atomic Silver', automatic: true,
        engine: 'Gasoline', horsepower: 235, cylinders: 4, drive_train: 'AWD', price: 37610, seating_capacity: 5)

      visit "/auto_dealerships/#{dealership_1.id}/automobiles/#{raptor.id}"
      expect(page).to have_content(raptor.model)
      expect(page).to have_content(raptor.year)
      expect(page).to_not have_content(fusion.model)
      expect(page).to_not have_content(gx460.model)
      expect(page).to_not have_content(nx300.model)

      visit "/auto_dealerships/#{dealership_2.id}/automobiles/#{nx300.id}"
      expect(page).to have_content(nx300.model)
      expect(page).to have_content(nx300.year)
      expect(page).to_not have_content(fusion.model)
      expect(page).to_not have_content(gx460.model)
      expect(page).to_not have_content(raptor.model)
    end
  end
end
