class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :asso, class_name: 'User', foreign_key: 'asso_id'

  def slug_candidates
    [
        [:id, :name]
    ]
  end
end