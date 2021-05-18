class TeamsController < ApplicationController
  def index
    @teams = Team.order_desc
  end

  def show
    @team = Team.find(params[:id])
  end
end