class Partner < ActiveRecord::Base
  # Relation to users
  belongs_to :asso, class_name: 'User', foreign_key: 'asso_id'

  # Asso picture
  mount_uploader :picture, PartnerPictureUploader

  validates :name, :description, presence: true
  validates :site_url, url: { message: I18n.t('errors.messages.url') }
end
