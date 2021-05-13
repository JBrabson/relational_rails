# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
music_store_1 = MusicStore.create!(name: "Ringos Rock About",
                                      rents: true,
                                      lesson_cost: 40)
music_store_2 = MusicStore.create!(name: "Jerry's Jams",
                                      rents: false,
                                      lesson_cost: 50)