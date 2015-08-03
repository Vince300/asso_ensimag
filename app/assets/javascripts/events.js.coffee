# = require underscore
# = require calendar/language/fr-FR
# = require calendar/calendar

$ ->
  init = ->
    $('.calendar').each (i, item) ->
      $(item).calendar
        language: 'fr-FR'
        events_source: $(item).attr('data-events-source')
        tmpl_path: '/tmpls/'
        weekbox: false

  $(document).ready(init)
  $(document).on('page:load', init)