class CreateRobots < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :name, null: false
      t.boolean :in_stock, default: false
      t.integer :product_id, null: false

      t.timestamps null: false
    end
  end
end
