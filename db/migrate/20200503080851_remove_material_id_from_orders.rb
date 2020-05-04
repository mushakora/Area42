class RemoveMaterialIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :material_id, :integer
  end
end
