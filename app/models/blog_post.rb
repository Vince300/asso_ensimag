class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Blog posts ordered from most recent to most ancient
  default_scope -> { order(published: :desc) }

  # Only published blog posts
  scope :published, -> { where('published <= ?', DateTime.now) }

  # Author relation
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def slug_candidates
    [
        [:id, :title]
    ]
  end

  # Fix for published time formatting
  include DatetimeAttributesHelper
  datetime_attribute :published

  # Pagination using kaminari
  paginates_per 5
end
