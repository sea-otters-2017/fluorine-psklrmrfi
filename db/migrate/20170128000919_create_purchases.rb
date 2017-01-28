class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :robot_id
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
