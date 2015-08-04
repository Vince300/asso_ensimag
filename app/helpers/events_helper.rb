module EventsHelper
  def sidebar_item_class(link, set_success = false)
    path = URI(request.original_url).path.gsub /\/page\/\d+$/, ''
    active = (link == path)
    "list-group-item #{active ? 'active' : ''} #{set_success and (not active) ? 'list-group-item-success' : ''}"
  end
end
