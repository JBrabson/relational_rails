require 'rails_helper'

RSpec.describe 'the instrument edit' do
  it 'links to the edit page' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

    visit '/instruments'

    click_button "Edit"

    expect(current_path).to eq("/instruments/#{instrument.id}/edit")
  end

  it 'can edit instruments' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

    visit '/instruments'

    expect(page).to have_content("Guitar")

    click_button 'Edit'

    fill_in 'cost', with: 500
    click_button 'Update Instrument'

    expect(current_path).to eq('/instruments')
    expect(page).to have_content(500)
  end
end