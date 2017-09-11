//= require underscore
//= require calendar/language/fr-FR
//= require calendar/calendar

function initCalendar() {
  var $cal = $('.calendar');
  if ($cal.length) {
      cal = $cal.calendar({
        language: 'fr-FR',
        events_source: $cal.attr('data-events-source'),
        tmpl_path: '/tmpls/',
        weekbox: false,
        time_start: '08:00',
        time_end: '24:00',
        time_split: '60',
        onAfterViewLoad: function(view) {
          $('.calendar-controls .btn-group button').removeClass('active');
          $('.calendar-control button[data-calendar-view="' + view + '"]').addClass('active');
          $('.calendar-title').text(this.getTitle());
        }
      });
    $('.calendar-controls').on('click', '.btn-group button', function(event) {
      var $this = $(this), d;
      if ((d = $this.data('calendar-nav')) !== undefined) {
        cal.navigate(d);
      } else if ((d = $this.data('calendar-view')) !== undefined) {
        cal.view(d);
      }
    });
  }
}

// Call initCalendar for every page load
$(document).on('turbolinks:load', initCalendar);

if ($.isReady) {
  // Turbolinks visit, page already ready
  window.setTimeout(initCalendar, 500);
}

