module AssosHelper
  def can_edit(item)
    return false if item.nil?

    return policy(item).edit?
  end

  def descriptive_blob(asso, len = 100)
    truncate (markdown_plain(asso.description) or "Pas de description"), length: len
  end
end
