# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AutoDealership.destroy_all

millerford = AutoDealership.create!(name: 'Larry H Miller Ford', preowned_sales: true, foreign_inventory: false, city: 'Denver', state: 'CO')
stevinsonlex = AutoDealership.create!(name: 'Stevinson Lexus', preowned_sales: true, foreign_inventory: true, city: 'Golden', state: 'CO')
alpinegmc = AutoDealership.create!(name: 'Alpine Buick GMC', preowned_sales: true, foreign_inventory: false, city: 'Littleon', state: 'CO')

millerford.automobiles.create!(preowned: false, year: 2022, make: 'Ford', model: 'F-150 Raptor', color: 'Gunmetal', automatic: true,
  engine: 'Gasoline Twin-Turbo', horsepower: 450, cylinders: 6, drive_train: '4WD', price: 62335, seating_capacity: 5)
millerford.automobiles.create!(preowned: true, year: 2020, make: 'Ford', model: 'Fusion SEL', color: 'Black Onyx', automatic: true,
  engine: 'Gasoline', horsepower: 175, cylinders: 4, drive_train: 'FWD', price: 23170, seating_capacity: 5)

stevinsonlex.automobiles.create!(preowned: false, year: 2021, make: 'Lexus', model: 'GX 460', color: 'Atomic Silver', automatic: true,
  engine: 'Gasoline', horsepower: 301, cylinders: 8, drive_train: '4WD', price: 53450, seating_capacity: 5)
stevinsonlex.automobiles.create!(preowned: false, year: 2021, make: 'Lexus', model: 'NX 300', color: 'Atomic Silver', automatic: true,
  engine: 'Gasoline', horsepower: 235, cylinders: 4, drive_train: 'AWD', price: 37610, seating_capacity: 5)

alpinegmc.automobiles.create!(preowned: false, year: 2021, make: 'GMC', model: 'Sierra 3500 HD', color: 'Summit White', automatic: true,
  engine: 'Turbo-Diesel', horsepower: 445, cylinders: 8, drive_train: '4WD', price: 57680, seating_capacity: 6)
alpinegmc.automobiles.create!(preowned: true, year: 2016, make: 'Chevy', model: 'Tahoe', color: 'Brownstone Metallic', automatic: true,
  engine: 'Flex Fuel', horsepower: 355, cylinders: 8, drive_train: '4WD', price: 41816, seating_capacity: 8)
