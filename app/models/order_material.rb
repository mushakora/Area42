class OrderMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :order
end
