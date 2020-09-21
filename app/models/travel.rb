class Travel < ApplicationRecord
  belongs_to :user
  validates :country, :location, presence: true, length: { maximum: 200 }
end
