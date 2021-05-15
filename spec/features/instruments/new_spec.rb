require 'rails_helper'

RSpec.describe 'the instrument creation' do
  it 'links to the new page from the instruments index' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit '/instruments'

    click_button('New Instrument')
    expect(current_path).to eq('/instruments/new')
  end

  it 'can create a new instrument' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit '/instruments/new'

    fill_in('Kind', with: 'Bass')
    fill_in('Rent to own', with: true)
    fill_in('Cost', with: 250)
    click_button('Create Instrument')

    expect(current_path).to eq("/instruments")
    expect(page).to have_content("Bass")
  end
end