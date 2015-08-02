require 'redcarpet/render_strip'

module ApplicationHelper
  def all_assos
    User.ordered_all
  end

  def markdown(text)
    return nil if text.nil?

    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        no_intra_emphasis: true,
                                        fenced_code_blocks: true,
                                        disable_indented_code_blocks: true) if @markdown.nil?
    return @markdown.render(text).html_safe
  end

  def markdown_plain(text)
    return nil if text.nil?

    @markdown_plain = Redcarpet::Markdown.new(Redcarpet::Render::StripDown) if @markdown_plain.nil?
    return @markdown_plain.render(text)
  end

  def title(page_title)
    content_for(:title) { page_title }
    return page_title
  end
end
