class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :products, through: :labelings
end
