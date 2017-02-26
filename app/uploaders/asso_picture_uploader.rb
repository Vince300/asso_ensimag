require 'carrierwave/processing/mini_magick'

class AssoPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Store to filesystem
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(version_name = nil)
    pth = if version_name == :homepage
            "fallback/homepage_asso.png"
          else
            "fallback/asso.png"
          end
    return ActionController::Base.helpers.asset_path(pth)
  end

  process :quality => 90
  process :resize_to_limit => [ 1920, 1440 ]

  # Enforce aspect ratio for asso list
  version :list do
    process :resize_to_fill => [ 710, 400 ]
  end

  # Specific homepage large version
  version :homepage do
    process :resize_to_fill => [ 1920, 400 ]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end
end
