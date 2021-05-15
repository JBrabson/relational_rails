require 'rails_helper'

RSpec.describe 'it shows the instrument and its attributes' do
  before :each do
    @music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    @instrument = @music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
    @instrument_2 = @music_store.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
  end
  it 'can show the instrument and its attributes by id' do
    visit "/instruments/#{@instrument.id}"

    expect(page).to have_content(@instrument.kind)
    expect(page).to have_content("Cost: $1000")
    expect(page).to have_content("Rent to own available")
    expect(page).to have_content("Location: Ringos Rock About")
    expect(page).to_not have_content(@instrument_2.kind)
    expect(page).to_not have_content("Cost: $1500")
    expect(page).to_not have_content("Rent to own unavailable")
  end
end