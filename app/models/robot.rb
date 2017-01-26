class Robot < ApplicationRecord

  validates :name, presence: true
  validates :in_stock, inclusion: { in: [ true, false ] }
  validates :product_id, presence: true

end
