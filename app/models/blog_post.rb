class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Blog posts ordered from most recent to most ancient
  default_scope -> { order(published: :desc) }

  # Only published blog posts
  scope :published, -> { where('published <= ?', DateTime.now) }

  # Author relation
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # Skip time zone conversion, assume local time
  self.skip_time_zone_conversion_for_attributes = [ :published ]

  def slug_candidates
    [
        [:id, :title]
    ]
  end
end
