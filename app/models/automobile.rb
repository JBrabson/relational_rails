class Automobile < ApplicationRecord
  belongs_to  :auto_dealership

  def self.preowned_true
    where("preowned = 'true'")
  end

  def self.order_by_make
    order(make: :asc)
    
  end
end
