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