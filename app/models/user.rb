class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :birth
    validates :nickname
        
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name
      validates :last_name
    end
        
     with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
       validates :kana_first
       validates :kana_family
     end
   end
                
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  has_many :items
end