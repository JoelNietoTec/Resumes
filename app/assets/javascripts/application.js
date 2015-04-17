// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/es-ES
//= require_tree ./shared
//= require_self

$(function() {
  $(".datepicker").datepicker({
    changeYear: true,
    changeMonth: true,
    showAnim: "blind"
  });
});

$(function() {
  $(".datepicker-future").datepicker({
    changeYear: true,
    changeMonth: true,
    showAnim: "blind",
    yearRange: "c:c+5",
  });
});



$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field;
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.datepicker');
  // and activate datepicker on it
  dateField.datepicker(
    {
      changeYear: true,
      changeMonth: true,
      showAnim: "blind"
    });
});
