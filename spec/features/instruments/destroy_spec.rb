require 'rails_helper'

RSpec.describe Instrument, type: :feature do
  describe '#destroy' do
    it 'can delete the instrument from the index page' do
      music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
      instrument = music_store.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)

      visit '/instruments'
      click_button 'Delete'

      expect(current_path).to eq('/instruments')
      expect(page).to_not have_content('Guitar')
    end
  end
end