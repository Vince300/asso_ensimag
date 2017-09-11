//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require moment
//= require moment/fr
//= require bootstrap-datetimepicker
//= require bootstrap-colorpicker

function initEditors() {
  $('.form-datetime').each(function (event) {
    var $this = $(this);
    var v = moment($this.find('input').val());
    $this.datetimepicker({
      locale: 'fr',
      sideBySide: true,
      showTodayButton: true,
      allowInputToggle: true,
      showClear: true
    });
    $this.data("DateTimePicker").date(v);
  });
  $('.colorpicker-editor').each(function (event) {
    $(this).colorpicker({
      align: 'left',
      format: 'hex'
    });
  });
  $('.btn-file :file').on('change', function (event) {
    var input = $(this);
    var txtInput = input.parents('.input-group').find(':text');
    txtInput.val(input.val());
  });
  $('.btn-clear').click(function (event) {
    var btn = $(this);
    var prnt = btn.parents('.input-group');
    var input = prnt.find('.btn-file :file');
    var txtInput = prnt.find(':text');
    input.val(null);
    txtInput.val(null);
  });
}

$(document).on('turbolinks:load', initEditors());
