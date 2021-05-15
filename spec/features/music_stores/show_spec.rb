require 'rails_helper'

RSpec.describe "it shows the music store and its attributes" do
  before :each do
    @music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    @music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50)
    @instrument_1 = @music_store_1.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
    @instrument_2 = @music_store_1.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
  end

  it 'can show a store by id with all attributes' do

    visit 'music_stores/1'

    expect(page).to have_content("Store number: 1")
    expect(page).to have_content("Ringos Rock About")
    expect(page).to have_content("Yes We Rent!!!")
    expect(page).to have_content("Lesson cost: $40")
  end

  it 'can show a second store by id with all attributes' do
    visit 'music_stores/2'

    expect(page).to have_content("Store number: 2")
    expect(page).to have_content("Jerry's Jams")
    expect(page).to have_content("No Rentals")
    expect(page).to have_content("Lesson cost: $50")
  end
end