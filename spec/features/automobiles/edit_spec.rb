require "rails_helper"

RSpec.describe "As a visitor"

# User Story 14
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
describe "When I visit an automobile's show page" do
  describe "I see a link to update the automobile, 'Update Automobile Information'" do
    describe "Then I click the link and am routed to a new page with form to edit the automobile"do
      describe "Then I fill out the form with updated information and click 'Save Changes'" do
        it "I am redirected back to the automobile's show page where I see changes made" do
          dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
            city: "Denver", state: "CO")
          raptor = dealership_1.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
            engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
          visit "/automobiles/#{raptor.id}"
          expect(page).to have_link("Update Automobile Information")
          click_link "Update Automobile Information"
          expect(current_path).to eq("/automobiles/#{raptor.id}/edit")

          fill_in "year", with: 2012
          fill_in "model", with: "F-150"
          fill_in "color", with: "Navy"
          click_on "Submit Changes"

          expect(current_path).to eq("/automobiles/#{raptor.id}")
          expect(page).to have_content("F-150")
          expect(page).to_not have_content("Raptor")
          expect(page).to have_content(2012)
          expect(page).to_not have_content("2022")
          expect(page).to have_content("Navy")
          expect(page).to_not have_content("Gunmetal")
        end
      end
    end
  end
end
