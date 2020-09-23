class Favolite < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_many :travels, dependent: :destroy
  has_many :users, dependent: :destroy
  validates :user_id, presence: true
  validates :travel_id, presence: true, uniqueness: { scope: :user_id }
end
