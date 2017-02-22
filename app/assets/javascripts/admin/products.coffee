# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#main_categories #product_category_id').on "change", ->
    selected_id = $('#main_categories #product_category_id option:selected').val()
    $.get "/admin/categories/#{selected_id}/get_subcategories"
