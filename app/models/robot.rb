class Robot < ApplicationRecord
  belongs_to :product
  has_one :manufacturer, through: :product
  has_one :purchase

  validates :name, presence: true
  validates :in_stock, inclusion: { in: [ true, false ] }
  validates :product_id, presence: true
  validates :available, inclusion: { in: [ true, false ] }

  before_validation :set_expected_date, on: :create

  def mark_received
    self.update_attributes(in_stock: true, available: true)
  end

  def self.in_stock
    self.all.where(in_stock: true)
  end

  def self.on_order
    self.all.where(in_stock: false)
  end

  def self.available
    self.all.where(available: true).where(in_stock: true)
  end

  def self.sold
    self.all.where(available: false)
  end

  def past_due?
    return true if self.expected_date < Time.now  && !in_stock
    false
  end

  private
  def set_expected_date
    self.expected_date = Time.now + 21.days
  end

end
