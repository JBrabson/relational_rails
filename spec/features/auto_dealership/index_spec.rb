require "rails_helper"

RSpec.describe "As a visitor"

# User Story 1
# As a visitor
# When I visit '/auto_dealerships'
# Then I see the name of each parent record in the system
describe "When I visit the Auto Dealerships index page" do
  it "displays all dealerships" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit '/auto_dealerships'
    expect(page).to have_content(dealership_1.name)
    expect(page).to have_content(dealership_2.name)
  end
end
