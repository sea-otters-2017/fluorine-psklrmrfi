class AddDiscontinuedFlagToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :discontinued, :boolean
  end
end
