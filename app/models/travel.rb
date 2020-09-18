class Travel < ApplicationRecord
  belongs_to :user
  validates :country, :location, :image, :content, presence: true
end
