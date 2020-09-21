class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_details, dependent: :destroy
  validates :country, :location, presence: true, length: { maximum: 200 }
end
