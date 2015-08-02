class Event < ActiveRecord::Base
  # Friendly URL generation
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Fetches the next events (for these, passed? == false)
  scope :coming, -> { where('end_time >= ?', DateTime.now).order(:start_time) }

  # Fetches the events ordered by their start_time
  scope :ordered, -> { order(start_time: :desc) }

  def slug_candidates
    [
        [:id, :name]
    ]
  end

  # Relation to users
  belongs_to :asso, class_name: 'User', foreign_key: 'asso_id'

  # Indicates if the event has passed
  def passed?
    DateTime.now > end_time
  end
end