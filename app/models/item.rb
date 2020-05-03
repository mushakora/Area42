class Item < ApplicationRecord
  has_many :favorites,dependent: :destroy
  def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
  end

  has_many :coupons
  attachment :image
end
