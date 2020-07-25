class Room < ApplicationRecord
  belongs_to :user
  belongs_to :producer

  has_many :messages
end
