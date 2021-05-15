require 'rails_helper'

RSpec.describe 'destroying an instrument' do
  it 'can delete the instrument from the index page' do
    music_store = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)

    visit '/music_stores'

    click_button 'Delete'

    expect(current_path).to eq('/music_stores')
    expect(page).to_not have_content('Ringos Rock About')
  end
end