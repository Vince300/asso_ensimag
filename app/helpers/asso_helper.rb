module AssoHelper
  def can_edit_asso(asso)
    current_user == asso
  end

  def descriptive_blob(asso)
    truncate (markdown_plain(asso.description) or "Pas de description"), length: 100
  end
end
