class Item < ApplicationRecord

  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_to_delivery
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :value
    validates :description
    validates :image

    with_options numericality: { other_than: 1 }  do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :day_to_delivery_id

      validates :value, format: { with: /\A[0-9]+\z/ }
      validates :value, numericality: { only_integer: true,greater_than: 299, less_than: 10000000
}
    end
  end
end