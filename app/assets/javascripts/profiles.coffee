# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  districts = $('#district_select').html();
  townships = $('#township_select').html();
  $(document).ready ->
    province = $('#province_select :selected').val()
    options = $(districts).filter("optgroup[label='#{province}']").html()
    if options
      $('#district_select').html(options)
    else
      $('#district_select').html("No Disponible")
    district = $('#district_select :selected').val()
    options2 = $(townships).filter("optgroup[label='#{district}']").html()
    if options2
      $('#township_select').html(options2)
    else
      $('#township_select').html("No Disponible")
  $('#province_select').change ->
    province = $('#province_select :selected').val()
    options = $(districts).filter("optgroup[label='#{province}']").html()
    if options
      $('#district_select').html(options)
    else
      $('#district_select').html("No Disponible")
    district = $('#district_select :selected').val()
    options2 = $(townships).filter("optgroup[label='#{district}']").html()
    if options2
      $('#township_select').html(options2)
    else
      $('#township_select').html("No Disponible")
  $('#district_select').change ->
    district = $('#district_select :selected').val()
    options = $(townships).filter("optgroup[label='#{district}']").html()
    if options
      $('#township_select').html(options)
    else
      $('#township_select').html("No Disponible")
