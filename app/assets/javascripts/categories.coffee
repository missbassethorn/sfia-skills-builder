# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  subcategories = $('#subcategory_subcategory_id').html()
  $('#category_category_id').change ->
    category = $('#category_category_id :selected').text()
    options = $(subcategories).filter("optgroup[label='#{category}']").html()
    if options
      $('#subcategory_subcategory_id').html(options)
    else
      $('#subcategory_subcategory_id').empty()

  skills = $('#skill_skill_id').html()
  $('#subcategory_subcategory_id').change ->
    subcategory = $('#subcategory_subcategory_id :selected').text()
    options = $(skills).filter("optgroup[label='#{subcategory}']").html()
    if options
      $('#skill_skill_id').html(options)
    else
      $('#skill_skill_id').empty()