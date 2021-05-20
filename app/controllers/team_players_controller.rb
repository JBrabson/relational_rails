class TeamPlayersController < ApplicationController
  def index
    @players = Player.where(team_id: params[:id])
  end