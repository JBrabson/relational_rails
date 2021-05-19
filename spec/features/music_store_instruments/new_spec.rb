require 'rails_helper'

RSpec.describe 'the instrument creation' do
  it 'links to the new page from the instruments index' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit "/music_stores/#{music_store.id}/instruments"

    click_button('New Instrument')
    expect(current_path).to eq("/music_stores/#{music_store.id}/instruments/new")
  end

  it 'can create a new instrument' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit "/music_stores/#{music_store.id}/instruments/new"

    fill_in('Kind', with: 'Bass')
    choose(option: "true")
    fill_in('Cost', with: 250)
    click_button('Create Instrument')

    expect(current_path).to eq("/music_stores/#{music_store.id}/instruments")
    expect(page).to have_content("Bass")
  end

  it 'has links to both parent/child index' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit "/music_stores/#{music_store.id}/instruments/new"
    click_link "All Instruments"

    expect(current_path).to eq('/instruments')

    visit "/music_stores/#{music_store.id}/instruments/new"
    click_link "All Music Stores"

    expect(current_path).to eq('/music_stores')
  end
end