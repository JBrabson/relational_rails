class TeamPlayersController < ApplicationController
  def index
    # require "pry"; binding.pry
    @players = Player.where(team_id: params[:id])
  end
end