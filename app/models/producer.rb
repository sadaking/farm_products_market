class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :producer_name, presence: true
  validates :email, presence: true
  validates :producer_postal_code, presence: true
  validates :producer_prefecture_code, presence: true
  validates :producer_address_city, presence: true
  validates :producer_address_street, presence: true
  validates :producer_address_building, presence: true

  has_many :products
  has_many :rooms
  has_one_attached :producer_avatar
end
