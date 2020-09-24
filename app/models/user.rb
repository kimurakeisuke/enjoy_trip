class User < ApplicationRecord
  has_many :travels, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :favorited_travels, through: :favorites, source: :travel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }
end
