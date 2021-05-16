require 'rails_helper'

RSpec.describe 'music_store_instruments index' do
  before :each do
    @music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    @music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50)
    @instrument_1 = @music_store_1.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
    @instrument_2 = @music_store_1.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
  end
  it 'can show all of its instruments' do
    visit "music_stores/#{@music_store_1.id}/instruments"

    expect(page).to have_content(@instrument_1.kind)
    expect(page).to have_content("Cost: $1000")
    expect(page).to have_content("Rent to own available")
    expect(page).to have_content(@instrument_2.kind)
    expect(page).to have_content("Cost: $1500")
    expect(page).to have_content("Rent to own unavailable")
  end

  it 'has links to parent/child index' do
    visit "music_stores/#{@music_store_1.id}/instruments"
    click_link "All Music Stores"

    expect(current_path).to eq('/music_stores')

    visit "music_stores/#{@music_store_1.id}/instruments"
    click_link "All Instruments"

    expect(current_path).to eq('/instruments')
  end
end