require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it {should belong_to :music_store}

  describe 'class methods' do
    describe '#rentable' do
      it 'can sort the music stores by their instrument count' do
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Fancy Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        instrument_1 = music_store_3.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
        instrument_2 = music_store_3.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
        instrument_3 = music_store_3.instruments.create!(kind: "Piano", rent_to_own: false, cost: 10000)
        instrument_4 = music_store_1.instruments.create!(kind: "Mandoline", rent_to_own: true, cost: 100)
        instrument_5 = music_store_2.instruments.create!(kind: "Electric Guitar", rent_to_own: false, cost: 700)
        instrument_6 = music_store_2.instruments.create!(kind: "Amp", rent_to_own: true, cost: 300)

        expect(Instrument.rentable.count).to eq(3)
        expect(Instrument.rentable.first).to eq(instrument_1)
      end
    end

    describe '#find_exact' do
      it 'finds all instruments that match the exact search' do
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Fancy Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        instrument_1 = music_store_3.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
        instrument_2 = music_store_3.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
        instrument_3 = music_store_3.instruments.create!(kind: "Piano", rent_to_own: false, cost: 10000)
        instrument_4 = music_store_1.instruments.create!(kind: "Mandoline", rent_to_own: true, cost: 100)
        instrument_5 = music_store_2.instruments.create!(kind: "Electric Guitar", rent_to_own: false, cost: 700)
        instrument_6 = music_store_2.instruments.create!(kind: "Amp", rent_to_own: true, cost: 300)

        params = {"utf8"=>"✓", "search"=>"guitar", "commit"=>"Search exact match", "controller"=>"instruments", "action"=>"find_exact"}

        expect(Instrument.find_exact(params)).to eq([instrument_1])
      end
    end

    describe '#find_partial' do
      it 'finds all instruments that match the partial search' do
        music_store_1 = MusicStore.create!(name: "Ringos Rock About", rents: true, lesson_cost: 40, created_at: "2021-05-15 20:11:38")
        music_store_2 = MusicStore.create!(name: "Jerry's Jams", rents: false, lesson_cost: 50, created_at: "2021-04-15 20:11:38")
        music_store_3 = MusicStore.create!(name: "Henry's Fancy Music Store", rents: false, lesson_cost: 70, created_at: "2021-03-15 20:11:38")
        instrument_1 = music_store_3.instruments.create!(kind: "Guitar", rent_to_own: true, cost: 1000)
        instrument_2 = music_store_3.instruments.create!(kind: "Drums", rent_to_own: false, cost: 1500)
        instrument_3 = music_store_3.instruments.create!(kind: "Piano", rent_to_own: false, cost: 10000)
        instrument_4 = music_store_1.instruments.create!(kind: "Mandoline", rent_to_own: true, cost: 100)
        instrument_5 = music_store_2.instruments.create!(kind: "Electric Guitar", rent_to_own: false, cost: 700)
        instrument_6 = music_store_2.instruments.create!(kind: "Amp", rent_to_own: true, cost: 300)

        params = {"utf8"=>"✓", "search"=>"guitar", "commit"=>"Search partial match", "controller"=>"instruments", "action"=>"find_partial"}

        expect(Instrument.find_partial(params)).to eq([instrument_1, instrument_5])
      end
    end
  end
end