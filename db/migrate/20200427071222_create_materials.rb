class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :user_id
      t.string :genre
      t.string :name

      t.timestamps
    end
  end
end
