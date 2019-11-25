class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process resize_to_fit: [400, 400]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, 'default.png'].compact.join('_')
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
