class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.integer :item_id
      t.integer :coupon_price

      t.timestamps
    end
  end
end
