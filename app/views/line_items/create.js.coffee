$('#current_cart').html("<%= escape_javascript refresh(@cart) %>");
$(document).trigger "cart:update"
alert "товар << <%=j @product.name%> >> добавлен в корзину."