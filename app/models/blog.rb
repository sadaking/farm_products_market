class Blog < ApplicationRecord
  belongs_to :producer, optional: true
  belongs_to :user, optional: true
end
