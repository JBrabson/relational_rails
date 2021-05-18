class MusicStore < ApplicationRecord
  has_many :instruments

  def self.sort_by_date
    order(created_at: :desc)
  end

  def self.sort
    MusicStore.all.sort do |a, b|
      b.instruments.count <=> a.instruments.count
    end
  end

  def self.find_exact(params)
    MusicStore.all.find_all do |music_store|
      music_store.name.downcase == params["search"].downcase
    end
  end

  def self.find_partial(params)
    MusicStore.all.find_all do |music_store|
      music_store.name.downcase.include?(params["search"].downcase)
    end
  end
end