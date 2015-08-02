module EventsHelper
  def sidebar_item_class(link, set_success = false)
    active = current_page? link
    "list-group-item #{active ? 'active' : ''} #{set_success and (not active) ? 'list-group-item-success' : ''}"
  end
end
