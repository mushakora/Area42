class Item < ApplicationRecord
  has_many :favorites
  has_many :coupons
  attachment :image
end
