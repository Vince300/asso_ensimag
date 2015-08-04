json.success 1
json.result @events do |event|
  st = event.start_time.to_datetime
  et = event.end_time.to_datetime

  # If the event is less than one day, truncate the end time so it doesn't appear on the next day
  if event.duration < 1.day and st.to_date != et.to_date
    et = DateTime.new(st.year, st.month, st.mday, 23, 59, 59, st.offset)
  end

  json.id    event.id
  json.title "#{event.asso.username} : #{event.name}"
  json.url   event_path(event)
  json.start st.strftime('%Q')
  json.end   et.strftime('%Q')
  json.class "event-#{event.asso.to_param}"
end