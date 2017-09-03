class Event < ActiveRecord::Base
  # Friendly URL generation
  include FakeSlug
  fake_slug_uses :id, :name

  # Fetches the next events (for these, passed? == false)
  scope :coming, -> { where('end_time >= ?', DateTime.now).order(:start_time) }
  scope :passed, -> { where('end_time < ?',  DateTime.now).order(start_time: :desc) }

  # Fetches the events ordered by their start_time
  scope :ordered, -> { order(start_time: :desc) }

  # Returns only published events
  scope :published, -> (user = nil) { q = joins(:asso)
                                      if user.nil?
                                        q.where('published <= ? AND users.order IS NOT NULL', DateTime.now)
                                      else
                                        q.where('asso_id = :id OR (published <= :date AND users.order IS NOT NULL)',
                                                id: user.id, date: DateTime.now)
                                      end }

  # Relation to users
  belongs_to :asso, class_name: 'User', foreign_key: 'asso_id'

  # Indicates if the event has passed
  def passed?
    DateTime.now > end_time
  end

  def coming?
    DateTime.now < start_time
  end

  def duration
    end_time - start_time
  end

  # Fix for published time formatting
  include DatetimeAttributes
  datetime_attribute :start_time, :end_time

  # Kaminari pagination
  paginates_per 15

  mount_uploader :picture, EventPictureUploader

  # Validation attributes
  validates :name, :location, :description, :asso, presence: true
  validates :start_time, date: true
  validates :end_time, date: { after: :start_time }
  validates :facebook_url, url: { allow_nil: true, allow_blank: true, message: I18n.t('errors.messages.url') }
end