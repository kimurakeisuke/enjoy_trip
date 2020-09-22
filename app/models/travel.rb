class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_details, dependent: :destroy
  validates :country, :location, presence: true, length: { maximum: 200 }
  accepts_nested_attributes_for :travel_details, allow_destroy: true
end
