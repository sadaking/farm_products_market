class Product < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :comments, dependent: :destroy
  belongs_to :producer

  scope :title_search, -> (title) {where("title LIKE ?", "%#{title}%")}
end
