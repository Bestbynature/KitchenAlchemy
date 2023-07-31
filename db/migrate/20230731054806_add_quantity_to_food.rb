class AddQuantityToFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :quantity, :integer
  end
end
