class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   include JpPrefecture
   jp_prefecture :prefecture_code, method_name: :pref


   def prefecture_name
     JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
   end

   def prefecture_name=(prefecture_name)
     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
   end

   validates :name, presence: true
   validates :email, presence: true
   validates :postal_code, presence: true
   validates :prefecture_code, presence: true
   validates :address_city, presence: true
   validates :address_street, presence: true

   has_one :credit_card, dependent: :destroy
   has_many :rooms
   has_many :favorites, dependent: :destroy
   has_many :favorite_persons, dependent: :destroy
   has_one_attached :avatar
end
