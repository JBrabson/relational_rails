require 'rails_helper'

RSpec.describe 'a players specific page' do
  it 'display all attributes about a certain player' do
    tampa = Team.create!(name: "Tampa Bay Buccaneers")
    lakers = Team.create!(name: "Los Angeles Lakers")
    player_1 = Player.create!(team_id:tampa.id, name:"Mike Evans", age:27, healthy:true)
    player_2 = Player.create!(team_id:lakers.id, name:"LeBron James", age:36, healthy:true)

    visit "/players/#{player_1.id}"

    expect(page).to have_content(player_1.name)
    
    visit "/players/#{player_2.id}"
    
    expect(page).to have_content(player_2.name)
  end  
end