class User < ApplicationRecord
  has_many :travels, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # user.favorited_travels で user を「いいね!」しているユーザー一覧が取得できるようになる
  has_many :favorited_travels, through: :favorites, source: :travel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }

  def self.guest
    # find_or_create_byは新規作成後、保存してくれる
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
