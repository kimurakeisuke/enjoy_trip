class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_details, dependent: :destroy
  validates :country, :region, presence: true, length: { maximum: 200 }
  validates :city, length: { maximum: 200 }
  accepts_nested_attributes_for :travel_details, allow_destroy: true

  has_many :favorites, dependent: :destroy
  # travel.favorited_users で travel を「いいね!」しているユーザー一覧が取得できるようになる
  has_many :favorited_users, through: :favorites, source: :user

  before_save :search_lat_and_lng

  def favorited_by?(user)
    favorites.find_by(user_id: user.id).present?
  end

  def search_lat_and_lng
    search_words = "#{self.country} #{self.region} #{self.city}"
    geocoder = Geocoder.search(search_words).first
    self.latitude = geocoder.latitude
    self.longitude = geocoder.longitude

    # 海外の場合は、こちらが動く
    self.country_code = geocoder.country_code
    country = ISO3166::Country.new(self.country_code)
    self.continent = country.continent

    # 日本の場合は、地域区分 area を定義
    if self.country_code == "JP"
      state = geocoder.state
      pref = JpPrefecture::Prefecture.find name: state
      self.area = pref.area
    else
      self.area = nil
    end
  end
end
