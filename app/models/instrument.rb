class Instrument < ApplicationRecord
  belongs_to :music_store

  def self.rentable
    where("rent_to_own = true")
  end

  def self.find_exact(params)
    Instrument.all.find_all do |instrument|
      instrument.kind.downcase == params["search"].downcase
    end
  end

  def self.find_partial(params)
    Instrument.all.find_all do |instrument|
      instrument.kind.downcase.include?(params["search"].downcase) == true
    end
  end
end