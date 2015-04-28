module CartsHelper
  def show_cart(cart)
    render 'carts/carts', cart: cart
    text="В корзине #{cart.total_line_items} #{Russian.p(cart.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(cart.total_amount)}"
    content_tag(:div, text, class: "alert alert-danger", id:"current_cart")
  end

  def refresh(cart)
    "В корзине #{cart.total_line_items} #{Russian.p(cart.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(cart.total_amount)}"
  end
end