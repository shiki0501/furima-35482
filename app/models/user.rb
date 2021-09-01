class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name_kanji
    validates :last_name_kanji
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday
  end

  has_many :items
  has_many :buys

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\Z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_KANJI_REGEX = /\A([ぁ-んァ-ヶ一ー-龥々]+)\Z/
  validates :first_name_kanji, format: { with: VALID_KANJI_REGEX }
  validates :last_name_kanji, format: { with: VALID_KANJI_REGEX }

  VALID_KANA_REGEX = /\A[ァ-ヶーー]+\Z/
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
  validates :last_name_kana, format: { with: VALID_KANA_REGEX }
end
