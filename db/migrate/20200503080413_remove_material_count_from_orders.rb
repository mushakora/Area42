class RemoveMaterialCountFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :material_count, :integer
  end
end
