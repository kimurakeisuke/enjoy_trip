class User < ApplicationRecord
  has_many :travels, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :favorited_travels, through: :favorites, source: :travel
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
