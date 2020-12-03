class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :day_to_delivery

  validates :title, :text, presence: true
  validates :value, :text, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 1 } 
  validates :day_to_delivery_id, numericality: { other_than: 1 } 
end
