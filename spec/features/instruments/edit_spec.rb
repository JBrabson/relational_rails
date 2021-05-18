require 'rails_helper'

RSpec.describe Instrument, type: :feature do
  describe '#edit' do
    it 'links to the edit page' do
      music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
      instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

      visit "/instruments/#{instrument.id}"

      click_button "Edit"

      expect(current_path).to eq("/instruments/#{instrument.id}/edit")
    end

    it 'can edit instruments' do
      music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
      instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

      visit "/instruments/#{instrument.id}"

      expect(page).to have_content("Guitar")

      click_button 'Edit'

      fill_in 'cost', with: 500
      click_button 'Update Instrument'

      expect(current_path).to eq("/instruments/#{instrument.id}")
      expect(page).to have_content(500)
    end

    it 'has links to parent/child index' do
      music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
      instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

      visit "/instruments/#{instrument.id}"
      click_button 'Edit'
      click_link 'All Music Stores'

      expect(current_path).to eq('/music_stores')

      visit "/instruments/#{instrument.id}"
      click_button 'Edit'
      click_link 'All Instruments'

      expect(current_path).to eq('/instruments')
    end
  end
end