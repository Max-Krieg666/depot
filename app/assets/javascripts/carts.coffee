$ ->
  $(document).on 'cart:update', ->
    $.ajax
      url: '/carts.js'
      method: 'GET'
      dataType: 'html'
      success: (data)->
        $("#cart_info").html(data)