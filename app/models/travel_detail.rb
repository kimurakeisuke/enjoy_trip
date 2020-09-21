class TravelDetail < ApplicationRecord
  belongs_to :travel
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 10000 }
end
