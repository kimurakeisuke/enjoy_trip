class Like < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  validates :user_id, presence: true
  validates :travel_id, presence: true, uniqueness: { scope: :user_id }
end
