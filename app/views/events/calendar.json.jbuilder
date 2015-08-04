json.success 1
json.result @events do |event|
  # bootstrap-calendar required properties
  json.id    event.id
  json.title event.name
  json.url   event_path(event)
  json.start event.start_time.to_datetime.strftime('%Q')
  json.end   event.end_time.to_datetime.strftime('%Q')
  json.class "event-#{event.asso.to_param}"
  # Custom properties
  #  The real end time of the event
  json.location event.location
  #  Properties of the organizing asso
  json.asso do
    json.name event.asso.username
    json.url  asso_path(event.asso)
  end
end