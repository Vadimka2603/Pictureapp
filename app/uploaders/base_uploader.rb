class BaseUploader < CarrierWave::Uploader::Base

include CarrierWave::BombShelter

  def store_dir
    slashed_id = format('%09d', model.id).gsub(/(\d.+)(\d{3})(\d{3})$/, '\1/\2/\3')
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{slashed_id}"
  end

  def max_pixel_dimensions
    [8192, 8192]
  end
end