class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  validates :user_id, presence: true, uniqueness: { scope: :travel_id }
  validates :travel_id, presence: true
end
