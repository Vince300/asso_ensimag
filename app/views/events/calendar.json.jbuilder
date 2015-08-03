json.success 1
json.result @events do |event|
  json.id    event.id
  json.title "#{event.asso.username} : #{event.name}"
  json.url   event_path(event)
  json.start event.start_time.to_datetime.strftime('%Q')
  json.end   event.end_time.to_datetime.strftime('%Q')
end