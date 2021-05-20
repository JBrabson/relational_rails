require "rails_helper"

RSpec.describe "Auto Dealership Edit" do

# User Story 12, Parent Update
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
  describe "I can visit a dealership edit page from the show page" do
    it "and see changes reflected in the index after completion" do
      dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
        city: "Denver", state: "CO")
      visit "/auto_dealerships/#{dealership_1.id}"
      expect(page).to have_link("Update Dealership Information")
      click_link "Update Dealership Information"
      expect(current_path).to eq("/auto_dealerships/#{dealership_1.id}/edit")

      fill_in "Name", with: "The New Larry"
      click_on "Submit Changes"

      expect(current_path).to eq("/auto_dealerships/#{dealership_1.id}")
      expect(page).to have_content("The New Larry")
      expect(page).to_not have_content("Larry H Miller")
    end
  end
end
