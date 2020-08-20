class Product < ApplicationRecord
  has_one_attached :image
  has_many_attached :sub_images
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :comments, dependent: :destroy
  belongs_to :producer

  validates :title, presence: true ,length: { maximum: 25 }
  validates :price, presence: true
  validates :quantity, presence: true
  validates :content, presence:true ,length: { maximum: 300 }
  validates :harvest_date, presence:true
  validates :farm_name, presence:true
  validates :farm_street_address, presence:true

  scope :title_search, -> (title) {where("title LIKE ?", "%#{title}%")}
end
