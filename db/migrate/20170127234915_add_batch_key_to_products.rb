class AddBatchKeyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :batch_key, :string
  end
end
