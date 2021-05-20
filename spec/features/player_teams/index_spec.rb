require 'rails_helper'

RSpec.describe 'the team players index page' do
  it 'displays the players names based on that team id' do
    tampa = Team.create!(name: "Tampa Bay Buccaneers")
    lakers = Team.create!(name: "Los Angeles Lakers")
    player_1 = Player.create!(team_id:tampa.id, name:"Mike Evans", age:27, healthy:true)
    player_2 = Player.create!(team_id:lakers.id, name:"LeBron James", age:36, healthy:true)

    visit "/teams/#{tampa.id}/players"

    expect(page).to have_content(player_1.name)

    visit "/teams/#{lakers.id}/players"

    expect(page).to have_content(player_2.name)
  end 
end