require 'rails_helper'

RSpec.describe 'the teams page' do
  it 'displays the teams names' do
    team_1 = Team.create!(name: "Tampa Bay Buccaneers")
    team_2 = Team.create!(name: "Dallas Cowboys")

    visit "/teams"

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end  
end