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
    # 式展開を使い中の変数内の文字列を取り出す
    search_words = "#{self.country} #{self.region} #{self.city}"
    # geocoderで住所や地名から緯度経度を取得できる。search_wordsの中に入っている初めのキーワードをgeocoderに格納する
    geocoder = Geocoder.search(search_words).first
    # geocoderの経度緯度が自分自身の経度緯度となる
    self.latitude = geocoder.latitude
    self.longitude = geocoder.longitude

    # 海外の場合は、こちらが動く
    self.country_code = geocoder.country_code
    # ISO3166は国名コードのことで自分自身の新しいcountry_codeがcountryに代入される
    country = ISO3166::Country.new(self.country_code)
    # continentは例えばEurope,Asiaなどがある。downcaseで大文字から小文字にして、gsubメソッドで指定したパターンにマッチした文字列を指定した文字列に置き換える
    self.continent = country.continent.downcase.gsub(/ /, "_")

    # 日本の場合は、地域区分 area を定義
    if self.country_code == "JP"
      state = geocoder.state
      # jpprefectureは都道府県コードと都道府県名を変換すライブラリ
      pref = JpPrefecture::Prefecture.find name: state
      # to_sメソッドは文字列以外のオブジェクトを文字列に変換するメソッド
      # to_hメソッドは配列をハッシュに変換するメソッド
      self.area = Settings.area.to_h.key(pref.area).to_s
    else
      self.area = nil
    end
  end
end
