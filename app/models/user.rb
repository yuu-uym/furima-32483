class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :kana_first,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_family, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth,       presence: true
  validates :nickname,    presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end