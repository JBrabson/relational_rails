require "rails_helper"

RSpec.describe "As a visitor"

  # User Story 1
  # When I visit '/auto_dealerships'
  # Then I see the name of each parent record in the system
describe "When I visit the Auto Dealerships index page" do
  it "it displays all dealerships" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit '/auto_dealerships'
    expect(page).to have_content(dealership_1.name)
    expect(page).to have_content(dealership_2.name)
  end
end

  # User Story 6, Parent Index sorted by Most Recently Created
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
describe "When I visit the Auto Dealerships index page" do
  it "it displays all dealerships and corresponding timestamp, ordered by most recently created" do
    dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit '/auto_dealerships'
    expect("Larry H Miller").to appear_before("Stevinson Lexus", only_text: true)
  end
end
