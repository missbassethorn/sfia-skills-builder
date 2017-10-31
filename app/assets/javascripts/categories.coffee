# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#subcategory-list').hide()
  $('#skill-list').hide()

  $('#category_category_id').change ->
    subcategories = $('#subcategory_subcategory_id').html()
    category = $('#category_category_id :selected').text()
    options = $(subcategories).filter("optgroup[label='#{category}']").html()

    if options
      $('#subcategory_subcategory_id').html(options)
      $('#subcategory-list').show()

  $('#subcategory_subcategory_id').change ->
    subcategory = $('#subcategory_subcategory_id :selected').text()
    skills = $('#skill_skill_id').html()
    options = $(skills).filter("optgroup[label='#{subcategory}']").html()

    if options
      $('#skill_skill_id').html(options)
      $('#skill-list').show()

  $('#skill_skill_id').change ->
    $('#skill-details').load('skills/' + $(this).val()+ ' .skill-details > *')
