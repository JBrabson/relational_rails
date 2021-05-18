require 'rails_helper'

RSpec.describe 'a team specific page' do
  it 'display all attributes about a certain team' do
    team_1 = Team.create!(name: "Tampa Bay Buccaneers")
    team_2 = Team.create!(name: "Dallas Cowboys")

    visit "/teams/#{team_1.id}"

    expect(page).to have_content(team_1.name)
    
    visit "/teams/#{team_2.id}"
    
    expect(page).to have_content(team_2.name)
  end  
end