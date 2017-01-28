class Product < ApplicationRecord
  belongs_to :manufacturer
  has_many :robots

  validates :model_number, :height, :weight, :manufacturer_id, :price, presence: true
end
