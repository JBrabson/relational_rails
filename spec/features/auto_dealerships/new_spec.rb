require 'rails_helper'

RSpec.describe "As a visitor"

# User Story 11, Parent Creation
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
describe "When I visit the Auto Dealerships index page" do
  describe "I see a link to create a new dealership" do
    describe "then I click this link and am taken to a new page containing a form to create a dealership" do
      describe "then I fill out the form with the dealership's attributes and click 'Create Auto Dealership'" do
        it "then it creates a new Auto Dealership which is reflected when I am redirected to the Auto Dealership page" do
          visit "/auto_dealerships"
          expect(page).to have_link("New Auto Dealership")
          click_on "New Auto Dealership"

          expect(current_path).to eq("/auto_dealerships/new")
          fill_in "Name", with: "GM Headquarters Lot"
          fill_in "Preowned sales", with: true
          fill_in "Foreign inventory", with: false
          fill_in "City", with: "Detroit"
          fill_in "State", with: "Michigan"

          click_on "Create Auto Dealership"
          expect(current_path).to eq("/auto_dealerships")
          expect(page).to have_content("GM Headquarters Lot")

          #Additional testing to ensure attributes pulled to show page;
          # how to pull ID?
        end
      end
    end
  end
end
