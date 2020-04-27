class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
  	  first_name + last_name
  end

  def active_for_authentication?
  	  super && (self.deleted_at == false)
  end

  attribute :user_status, :string, default: '有効'
  attribute :deleted_at, :boolean, default: 'false'

end
