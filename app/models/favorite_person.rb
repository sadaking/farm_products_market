class FavoritePerson < ApplicationRecord
  belongs_to :user
  belongs_to :producer
end
