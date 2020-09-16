class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :shipping_fee, :shipping_from, :days_for_shipping

  with_options presence: true do
    validates :name
    validates :content
    validates :image
    validates :category, numericality: { other_than: 1 }
    validates :condition, numericality: { other_than: 1 }
    validates :price
    validates :shipping_fee, numericality: { other_than: 1 }
    validates :shipping_from, numericality: { other_than: 1 }
    validates :days_for_shipping, numericality: { other_than: 1 }
  end
end
