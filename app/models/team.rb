class Team < ApplicationRecord
  has_many :players

  def player_count
    players.count
  end

  def self.order_desc
    all.order(created_at: :desc)
  end
end