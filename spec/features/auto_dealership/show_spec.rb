require "rails_helper"
# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
describe "Auto Dealership Show Page" do

  it "displays dealership and dealership attributes" do
    @dealership_1 = AutoDealership.create!(name: "Larry H Miller", preowned_sales: true, foreign_inventory: false,
      city: "Denver", state: "CO")
    @dealership_2 = AutoDealership.create!(name: "Stevinson Lexus", preowned_sales: true, foreign_inventory: true,
      city: "Golden", state: "CO")

    visit "/auto_dealerships/#{@dealership_1.id}"
    expect(page).to have_content(@dealership_1.name)
    expect(page).to_not have_content(@dealership_2.name)
    expect(page).to have_content(@dealership_1.preowned_sales)
    expect(page).to_not have_content(@dealership_2.preowned_sales)
    expect(page).to have_content(@dealership_1.foreign_inventory)
    expect(page).to_not have_content(@dealership_2.foreign_inventory)

    visit "/auto_dealerships/#{@dealership_2.id}"
    expect(page).to have_content(@dealership_2.name)
    expect(page).to_not have_content(@dealership_1.name)
    expect(page).to have_content(@dealership_2.preowned_sales)
    expect(page).to_not have_content(@dealership_1.preowned_sales)
    expect(page).to have_content(@dealership_2.foreign_inventory)
    expect(page).to_not have_content(@dealership_1.foreign_inventory)
  end
end
