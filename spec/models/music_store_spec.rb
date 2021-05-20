require 'rails_helper'

RSpec.describe MusicStore, type: :model do
  it {should have_many :instruments}

  describe 'class methods' do
    describe '#sort_by_date' do
      it 'returns the music stores by which ones were created most recently' do
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        music_store_4 = MusicStore.create!(name: "Music On The Cheap", rents: true, lesson_cost: 20, created_at: "2021-02-15 20:11:38")
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")

        expect(MusicStore.sort_by_date.first).to eq(music_store_1)
      end
    end

    describe '#sort' do
      it 'can sort the music stores by their instrument count' do
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Fancy Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        music_store_3.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
        music_store_3.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
        music_store_3.instruments.create!(kind: "Piano", rent_to_own: false, cost: 10000)
        music_store_1.instruments.create!(kind: "Mandoline", rent_to_own: true, cost: 100)
        music_store_2.instruments.create!(kind: "Electric Guitar", rent_to_own: false, cost: 700)
        music_store_2.instruments.create!(kind: "Amp", rent_to_own: true, cost: 300)

        expect(MusicStore.sort.first).to eq(music_store_3)
      end
    end


    describe '#find_exact' do
      it 'returns all music stores with an exact match' do
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        music_store_4 = MusicStore.create!(name: "Music On The Cheap", rents: true, lesson_cost: 20, created_at: "2021-02-15 20:11:38")
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")

        params = {"utf8"=>"✓", "search"=>"ringos rock about", "commit"=>"Search exact match", "controller"=>"music_stores", "action"=>"find_exact"}

        expect(MusicStore.find_exact(params)).to eq([music_store_1])
      end
    end

    describe '#find_partial' do
      it 'returns all partial matches for store names' do
        music_store_2 = MusicStore.create!(name: "Jerry's Rock", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        music_store_4 = MusicStore.create!(name: "Music On The Cheap", rents: true, lesson_cost: 20, created_at: "2021-02-15 20:11:38")
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")

        params = {"utf8"=>"✓", "search"=>"rock", "commit"=>"Search partial match", "controller"=>"music_stores", "action"=>"find_partial"}

        expect(MusicStore.find_partial(params)).to eq([music_store_2, music_store_1])
      end
    end
  end
end