class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :line_items, dependent: :destroy
  scope :ordering, -> {order(created_at: :desc)}

  STATUSES=%w(Оформлен Подтверждён Отменён Доставляется Завершён) #0 1 2 3 4
  validates :cart, presence: true
  validates :user, presence: true
  validates :address, presence: true
  validates :status, presence: true, inclusion: {in: 0...STATUSES.size}

  validate :check_cart

  def check_cart
    if cart && cart.line_items.blank?
      errors.add(:cart, "Корзина пуста!")
    end
  end
end