module AssoHelper
  def can_edit(item)
    return false if item.nil?

    if item.is_a? User
      current_user == item
    elsif item.is_a? BlogPost
      current_user == item.author
    elsif item.is_a? Event
      current_user == item.asso
    else
      false
    end
  end

  def descriptive_blob(asso, len = 100)
    truncate (markdown_plain(asso.description) or "Pas de description"), length: len
  end
end
