# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  description :text
#  picture     :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Photo < ActiveRecord::Base
  self.per_page = 10

  belongs_to :user, counter_cache: true, required: true

  mount_uploader :picture, PictureUploader

  scope :feed, -> { order(created_at: :desc).take(10) }
  
  
  private

  def picture_size
    if picture.size > 5.megabytes
      raise "should be less than 5MB"
    end
  end
end
