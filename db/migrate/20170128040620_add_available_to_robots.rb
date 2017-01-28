class AddAvailableToRobots < ActiveRecord::Migration[5.0]
  def change
    add_column :robots, :available, :boolean
  end
end
