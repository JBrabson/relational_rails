require 'rails_helper'

RSpec.describe 'instruments on index page', type: :feature do
  it 'can list all the instruments and their cost' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    instrument_1 = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
    instrument_2 = music_store.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)

    visit '/instruments'

    expect(page).to have_content(instrument_1.kind)
    expect(page).to have_content(instrument_2.kind)
    expect(page).to have_content("Cost: $1000")
    expect(page).to have_content("Cost: $1500")
    expect(page).to have_content("Rent to own available")
    expect(page).to have_content("Rent to own unavailable")
  end
end