class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

   include JpPrefecture
   jp_prefecture :prefecture_code, method_name: :pref


   def prefecture_name
     JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
   end

   def prefecture_name=(prefecture_name)
     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
   end

   has_many :rooms
end
