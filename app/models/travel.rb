class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_details, dependent: :destroy
  validates :country, :region, presence: true, length: { maximum: 200 }
  validates :city, length: { maximum: 200 }
  accepts_nested_attributes_for :travel_details, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  before_save :search_lat_and_lng

  def favorited_by?(user)
    favorites.find_by(user_id: user.id).present?
  end

  def search_lat_and_lng
    search_words = "#{self.country} #{self.region} #{self.city}"
    results = Geocoder.search(search_words)
    self.latitude = results.first.latitude
    self.longitude = results.first.longitude
  end
end
