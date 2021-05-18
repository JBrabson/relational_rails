require 'rails_helper'

RSpec.describe "As a visitor"
# User Story 13, Parent Child Creation
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
describe "When I visit an automobile show page associated with a dealership" do
  describe "I see a link to add a new vehicle to dealership, 'Add Vehicle'" do
    describe "When I click the link I am taken to a page with form to add vehicle" do
      describe "After I fill out the form with attributes, I click 'Save Vehicle'" do
        it "I am redirected to the show page and see the new vehicle listed" do
        dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
          city: "Denver", state: "CO")
        raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
          engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
        fusion = dealership_1.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
            engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

        visit "/auto_dealerships/#{dealership_1.id}/automobiles"
        expect(page).to have_link("Add Vehicle")
        click_link "Add Vehicle"

        expect(current_path).to eq("/auto_dealerships/#{dealership_1.id}/automobiles/new")
        fill_in "preowned", with: true
        fill_in "year", with: 2011
        fill_in "make", with: "Ford"
        fill_in "model", with: "F-150"
        fill_in "color", with: "Navy"
        fill_in "automatic", with: true
        fill_in "engine", with: "Gasoline"
        fill_in "horsepower", with: 250
        fill_in "cylinders", with: 6
        fill_in "drive_train", with: "4WD"
        fill_in "price", with: 9750

        click_on "Add to Automobiles at #{dealership_1.name}"
        expect(current_path).to eq("/auto_dealerships/#{dealership_1.id}/automobiles")
        expect(page).to have_content("2011 Ford F-150")
        end
      end
    end
  end
end
