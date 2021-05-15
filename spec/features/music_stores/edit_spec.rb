require 'rails_helper'

RSpec.describe 'the instrument edit' do
  it 'links to the edit page' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit '/music_stores'

    click_button "Edit"

    expect(current_path).to eq("/music_stores/#{music_store.id}/edit")
  end

  it 'can edit instruments' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit '/music_stores'

    expect(page).to have_content("Ringos Rock About")

    click_button 'Edit'

    fill_in 'name', with: "Dino's Drum Palace"
    click_button 'Update Music Store'

    expect(current_path).to eq('/music_stores')
    expect(page).to have_content("Dino's Drum Palace")
  end
end