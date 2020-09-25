class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :travel, counter_cache: :favorites_count
  validates :user_id, presence: true, uniqueness: { scope: :travel_id, message: "は同じ投稿に2回以上いいねはできません" }
  validates :travel_id, presence: true
end
