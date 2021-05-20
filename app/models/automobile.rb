class Automobile < ApplicationRecord
  belongs_to  :auto_dealership

  def self.preowned_true
    where("preowned = 'true'")
  end
end
