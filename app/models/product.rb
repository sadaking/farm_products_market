class Product < ApplicationRecord
  has_one_attached :image
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
end
