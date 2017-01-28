class Purchase < ApplicationRecord
  belongs_to :robot
  validates :name, :email, :robot_id, presence: true
end
