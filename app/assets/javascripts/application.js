// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require epiceditor

//= require_tree .

(function($) {
  function init_editors() {
    $('.epiceditor textarea').each(function (i, item) {
      // Add a link to the markdown cheatsheet
      var adiv = $('<div />').addClass('text-right');
      adiv.append($('<a />').text("Markdown cheatsheet")
          .attr('href', "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet")
          .attr('target', '_blank'));
      $(item).parent().append(adiv);
      // Wrap the element in a div
      $(item).wrap($('<div />'));
      var dv = $(item).parent()[0];
      var editor = new EpicEditor({
        container: dv,
        theme: {
          base: '/assets/base/epiceditor.css',
          preview: '/assets/epiceditor/preview.css',
          editor: '/assets/epiceditor/editor.css'
        }
      });
      editor.load();
    })
  }

  $(document).ready(init_editors);
  $(document).on('page:load', init_editors);
})(jQuery);
