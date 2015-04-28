class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  validates :product, presence: true
  validates :product_id, uniqueness: {scope: :cart_id}
  validates :cart, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :price, presence: true

  def total_price
    quantity*price
  end
end
