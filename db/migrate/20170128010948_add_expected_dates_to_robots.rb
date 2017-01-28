class AddExpectedDatesToRobots < ActiveRecord::Migration[5.0]
  def change
    add_column :robots, :expected_date, :datetime
  end
end
