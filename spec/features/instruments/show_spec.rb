require 'rails_helper'

RSpec.describe 'it shows the instrument and its attributes' do
  it 'can show the instrument and its attributes by id' do
    music_store = MusicStore.create!(name: "Ringos Rock About",
                                     rents: true,
                                     lesson_cost: 40)
    instrument_1 = music_store.instruments.create!(id: 1,
                                                   kind: "Guitar",
                                                   rent_to_own: true,
                                                   cost: 1000)

    visit 'instruments/1'

    expect(page).to have_content(instrument_1.kind)
    expect(page).to have_content("Cost: $1000")
    expect(page).to have_content("Rent to own available")
  end

  it 'can show the instrument and its attributes by id' do
    music_store = MusicStore.create!(name: "Ringos Rock About",
                                     rents: true,
                                     lesson_cost: 40)
    instrument_2 = music_store.instruments.create!(id: 2,
                                                   kind: "Drums",
                                                   rent_to_own: false,
                                                   cost: 1500)

    visit 'instruments/2'

    expect(page).to have_content(instrument_2.kind)
    expect(page).to have_content("Cost: $1500")
    expect(page).to have_content("Rent to own unavailable")
  end
end