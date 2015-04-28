ready=->
  $("#product_weight").on "keyup", ->
    val = $(this).val()
    console.log val
    val = val.replace /\D/g, ""
    $(this).val val

$ ->
  ready()
$(document).on "page:load", ready