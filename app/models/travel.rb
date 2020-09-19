class Travel < ApplicationRecord
  belongs_to :user
  validates :country, :location, presence: true, length: { maximum: 200 }
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 10000 }
end
