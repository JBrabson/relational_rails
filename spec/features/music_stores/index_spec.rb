require 'rails_helper'

RSpec.describe 'music stores index page' do
  it 'can see all music stores' do
    music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40)
    music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50)
    visit '/music_stores'

    expect(page).to have_content(music_store_1.name)
    expect(page).to have_content(music_store_2.name)
  end
end