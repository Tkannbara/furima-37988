class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :shipping_address
  belongs_to :shipping_date
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
  validates :title
  validates :contents
  validates :image
  validates :category_id, numericality: { other_than: 1} 
  validates :product_status_id, numericality: { other_than: 1} 
  validates :shipping_charges_id, numericality: { other_than: 1} 
  validates :shipping_address_id, numericality: { other_than: 1 } 
  validates :shipping_date_id, numericality: { other_than: 1 } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
end
