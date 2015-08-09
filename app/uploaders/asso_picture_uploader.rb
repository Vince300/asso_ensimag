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
  def default_url
    "fallback/" + [version_name, "asso.png"].compact.join('_')
  end

  process :quality => 90

  # Process files as they are uploaded
  version :detail do
    process :resize_to_fit => [ 700, 300 ]
  end

  # Enforce aspect ratio for asso list
  version :list do
    process :resize_to_fill => [ 360, 154 ]
  end

  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

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
