class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :day_to_delivery

  
  with_options presence: true do
    validates :title
    validates :value

    with_options numericality: { other_than: 1 }  do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefectures_id
      validates :day_to_delivery_id
    end
  end
end