# frozen_string_literal: true

# class for avatar upload
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def store_dir
    'uploads/avatars/'
  end

  process resize_to_fill: [50, 50]

  def move_to_cache
    false
  end

  def move_to_store
    false
  end

  def extension_whitelist
    %w[jpg jpeg png gif]
  end

  def filename
    "#{model.id}.#{original_filename.split('.').last}" if original_filename
  end
end
