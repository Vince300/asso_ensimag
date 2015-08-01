module AssoHelper
  def can_edit(item)
    if item.is_a? User
      current_user == item
    elsif item.is_a? BlogPost
      current_user == item.author
    else
      false
    end
  end

  def descriptive_blob(asso)
    truncate (markdown_plain(asso.description) or "Pas de description"), length: 100
  end
end
