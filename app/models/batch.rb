class Batch < ApplicationRecord
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  belongs_to :product
  has_many :orders
  has_many :customers, through: :orders
end
