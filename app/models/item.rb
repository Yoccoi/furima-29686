class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_for_shipping
  
  belongs_to :user, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :content
    validates :image
    validates :category
    validates :condition
    validates :price
    validates :shipping_fee
    validates :prefecture
    validates :days_for_shipping
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :days_for_shipping_id
  end


end