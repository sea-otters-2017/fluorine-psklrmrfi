class Product < ApplicationRecord
  belongs_to :manufacturer

  validates :model_number, :height, :weight, :manufacturer_id, presence: true
end
