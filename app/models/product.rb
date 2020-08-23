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
  validate :image_presence
  validates :content, presence:true ,length: { maximum: 300 }
  validate :date_not_before_today
  validates :harvest_date, presence:true
  validates :farm_name, presence:true
  validates :farm_street_address, presence:true

  def image_presence
    if image.attached?
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  def date_not_before_today
    errors.add(:harvest_date, "は本日以前のものを選択してください") if harvest_date.nil? || harvest_date > Date.today
  end

  scope :title_search, -> (title) {where("title LIKE ?", "%#{title}%")}
end
