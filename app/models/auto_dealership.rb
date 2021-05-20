class AutoDealership < ApplicationRecord
  has_many  :automobiles

  def self.most_recently_created
    order(created_at: :desc)
  end
end
