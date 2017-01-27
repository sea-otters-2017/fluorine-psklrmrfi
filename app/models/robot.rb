class Robot < ApplicationRecord
  belongs_to :product
  has_one :manufacturer, through: :product

  validates :name, presence: true
  validates :in_stock, inclusion: { in: [ true, false ] }
  validates :product_id, presence: true

  def mark_received
    self.update_attribute(:in_stock, true)
  end

end
