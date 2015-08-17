module ApplicationHelper
  def all_assos
    User.ordered
  end

  def sanitizer
    Rails::Html::WhiteListSanitizer.new
  end

  def rich_safe(html)
    return sanitize(html)
  end

  def rich_plain(html)
    return nil if html.nil? || html.blank?
    return sanitizer.sanitize(html, tags: [])
  end

  def title(page_title)
    content_for(:title) { page_title }
    return page_title
  end
end
