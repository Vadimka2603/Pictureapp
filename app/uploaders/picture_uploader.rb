class PictureUploader < BaseUploader
  
  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 700]
  storage :file
end
