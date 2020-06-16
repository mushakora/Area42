class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy

  def name
  	  first_name + last_name
  end

  def active_for_authentication?
  	  super && (self.deleted_at == false)
  end

  def self.search(search)
    if search
      where(['first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end

  attribute :user_status, :string, default: '有効'
  attribute :deleted_at, :boolean, default: 'false'

end
