class CreateOrderMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :order_materials do |t|
      t.integer :material_id
      t.integer :order_id
      t.integer :material_count

      t.timestamps
    end
  end
end
