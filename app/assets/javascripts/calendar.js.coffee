# = require underscore
# = require calendar/language/fr-FR
# = require calendar/calendar

$ ->
  init = ->
    $cal = $('.calendar').first()
    if $cal
      window.calendar =
      cal = $cal.calendar
        language: 'fr-FR'
        events_source: $cal.attr('data-events-source')
        tmpl_path: '/tmpls/'
        weekbox: false
        time_start: '08:00'
        time_end: '24:00'
        time_split: '60'
        onAfterViewLoad: (view) ->
          $('.calendar-controls .btn-group button').removeClass 'active'
          $(".calendar-controls button[data-calendar-view=\"#{view}\"]").addClass 'active'
          $('.calendar-title').text(this.getTitle())
      $('.calendar-controls .btn-group button[data-calendar-nav]').each ->
        $this = $(this)
        $this.click ->
          cal.navigate $this.data('calendar-nav')
      $('.calendar-controls .btn-group button[data-calendar-view]').each ->
        $this = $(this)
        $this.click ->
          cal.view $this.data('calendar-view')

  $(document).ready(init)
  $(document).on('page:load', init)