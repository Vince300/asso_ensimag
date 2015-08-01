class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def slug_candidates
    [
        [:id, :title]
    ]
  end
end
