# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")
music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
music_store_3 = MusicStore.create!(name: "Henry's Fancy Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
music_store_4 = MusicStore.create!(name: "Music On The Cheap", rents: true, lesson_cost: 20, created_at: "2021-02-15 20:11:38")
music_store_1.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
music_store_1.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
music_store_3.instruments.create!(kind: "Piano", rent_to_own: false, cost: 10000)
music_store_4.instruments.create!(kind: "Mandoline", rent_to_own: true, cost: 100)
music_store_2.instruments.create!(kind: "Electric Guitar", rent_to_own: false, cost: 700)
music_store_2.instruments.create!(kind: "Amp", rent_to_own: true, cost: 300)

AutoDealership.destroy_all

millerford = AutoDealership.create!(name: 'Larry H Miller Ford', foreign_inventory: false, city: 'Denver', state: 'CO')
stevinsonlex = AutoDealership.create!(name: 'Stevinson Lexus', foreign_inventory: true, city: 'Golden', state: 'CO')
alpinegmc = AutoDealership.create!(name: 'Alpine Buick GMC', foreign_inventory: false, city: 'Littleon', state: 'CO')

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

