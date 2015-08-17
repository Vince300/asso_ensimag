class User < ActiveRecord::Base
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  # Slug column for friendlier URLs
  friendly_id :username, use: :slugged

  # Asso names won't change often, so always update the slug
  def should_generate_new_friendly_id?
    true
  end

  # Support for Devise authentication
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  devise authentication_keys: [:login]

  # Users should be ordered by the order value
  scope :ordered, -> { order(:order) }

  # BlogPost relation
  has_many :posts, class_name: 'BlogPost', foreign_key: 'author_id'

  # Event relation
  has_many :events, class_name: 'Event', foreign_key: 'asso_id'

  # Asso picture
  mount_uploader :picture, AssoPictureUploader

  # Gets the next event
  def next_event
    @next_event ||= events.coming.first
  end

  # Gets a few random assos
  def self.sample(count)
    self.order(APP_CONFIG['random_order_function']).limit(count)
  end

  # Validation attributes
  validates :username, presence: true
  validates :color, color: true
  validates :order, uniqueness: true
  validates :site_url, :facebook_url, url: { allow_nil: true, allow_blank: true, message: I18n.t('errors.messages.url') }
end
