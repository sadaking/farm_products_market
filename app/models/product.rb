class Product < ApplicationRecord
  has_one_attached :image
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :comments, dependent: :destroy

  scope :title_search, -> (title) {where("title LIKE ?", "%#{title}%")}
end
