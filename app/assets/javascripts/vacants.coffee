# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  districts = $('#district_select').html();
  $(document).ready ->
    province = $('#province_select :selected').val()
    options = $(districts).filter("optgroup[label='#{province}']").html()
    if options
      $('#district_select').html(options)
    else
      $('#district_select').html("No Disponible")
    district = $('#district_select :selected').val()
  $('#province_select').change ->
    province = $('#province_select :selected').val()
    options = $(districts).filter("optgroup[label='#{province}']").html()
    if options
      $('#district_select').html(options)
    else
      $('#district_select').html("No Disponible")
    district = $('#district_select :selected').val()
# Filter
  districts_filter = $('#district-filter').html();
  $(document).ready ->
    province_filter  = $('#province-filter :selected').val()
    options = $(districts_filter).filter("optgroup[label='#{province_filter}']").html()
    if options
      $('#district-filter').html("<option value> -Todos- </option>" + options)
    else
      $('#district-filter').html("<option value> -Todos- </option>")
  $('#province-filter').change ->
    province_filter  = $('#province-filter :selected').val()
    options = $(districts_filter).filter("optgroup[label='#{province_filter}']").html()
    if options
      $('#district-filter').html("<option value> -Todos- </option>" + options)
    else
      $('#district-filter').html("<option value> -Todos- </option>")
