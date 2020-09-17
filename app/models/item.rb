class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_for_shipping
  
  belongs_to :user, optional: true


  with_options presence: true do
    validates :name
    validates :content
    validates :image
    validates :category, numericality: { other_than: 1 }
    validates :condition, numericality: { other_than: 1 }
    validates :price
    validates :shipping_fee, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_for_shipping, numericality: { other_than: 1 }
  end
end
