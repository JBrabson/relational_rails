require 'rails_helper'

RSpec.describe MusicStore, type: :feature do
  describe '#new' do
    it 'links to the new page from the music stores index' do

      visit '/music_stores'

      click_button('New Music Store')
      expect(current_path).to eq('/music_stores/new')
    end

    it 'can create a new music store' do

      visit '/music_stores/new'

      choose(option: "true")
      fill_in('Name', with: "Rockin Rob's")
      fill_in('Lesson cost', with: 25)
      click_button('Create Music Store')

      expect(current_path).to eq("/music_stores")
      expect(page).to have_content("Rockin Rob's")
    end

    it 'has links to parent/child index' do
      visit '/music_stores/new'
      click_link "All Music Stores"

      expect(current_path).to eq('/music_stores')

      visit '/music_stores/new'
      click_link "All Instruments"

      expect(current_path).to eq('/instruments')
    end
  end
end