require 'rails_helper'

RSpec.describe "it shows the music store and its attributes" do
  before :each do
    @music_store_1 = MusicStore.create!(id: 1,
                                        name: "Ringos Rock About",
                                        rents: true,
                                        lesson_cost: 40)
    @music_store_2 = MusicStore.create!(id: 2,
                                        name: "Jerry's Jams",
                                        rents: false,
                                        lesson_cost: 50)
  end
  it 'can show a store by id with all attributes' do

    visit 'music_stores/1'

    expect(page).to have_content("Store number: 1")
    expect(page).to have_content("Ringos Rock About")
    expect(page).to have_content("Yes We Rent!!!")
    expect(page).to have_content("Lesson cost: $40")
  end
  it 'sdfsdf' do
    visit 'music_stores/2'

    expect(page).to have_content("Store number: 2")
    expect(page).to have_content("Jerry's Jams")
    expect(page).to have_content("No Rentals")
    expect(page).to have_content("Lesson cost: $50")
  end
end