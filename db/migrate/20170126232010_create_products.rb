class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :model_number, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.integer :manufacturer_id, null: false

      t.timestamps null: false
    end
  end
end
