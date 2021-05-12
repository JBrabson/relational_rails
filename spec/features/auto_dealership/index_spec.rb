require "rails_helper"
# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/auto_dealerships'
# Then I see the name of each parent record in the system

describe "Auto Dealerships Index" do

  it "displays all dealerships" do
    @dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    @dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit '/auto_dealerships'
    expect(page).to have_content(@dealership_1.name)
    expect(page).to have_content(@dealership_2.name)
  end
end
