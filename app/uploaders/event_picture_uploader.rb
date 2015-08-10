require 'carrierwave/processing/mini_magick'

class EventPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Store to filesystem
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    model.asso.picture_url(version_name)
  end

  process :quality => 90
  process :resize_to_limit => [ 1920, 1440 ]

  # Enforce aspect ratio for article list (crop/scale)
  version :list do
    process :resize_to_fill => [ 710, 400 ]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
