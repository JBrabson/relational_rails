require 'rails_helper'

RSpec.describe 'instruments on index page', type: :feature do
  it 'can list all the instruments and their cost' do
    instrument_1 = Instrument.create!(store_id: 1,
                                      kind: "Guitar",
                                      rent_to_own: true,
                                      cost: 1000)
    instrument_2 = Instrument.create!(store_id: 1,
                                      kind: "Drums",
                                      rent_to_own: false,
                                      cost: 1500)

    visit '/instruments'

    expect(page).to have_content(instrument_1.kind)
    expect(page).to have_content(instrument_2.kind)
    expect(page).to have_content(instrument_1.cost)
    expect(page).to have_content(instrument_2.cost)
  end
end