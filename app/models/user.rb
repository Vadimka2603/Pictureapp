# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  avatar           :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  photos_count     :integer
#

class User < ActiveRecord::Base
  self.per_page = 7

	has_many :photos, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  has_secure_password
  before_save   :downcase_name

  validates :password, :name, presence: true
  validates :name, uniqueness: true

  def downcase_name #Нижний регистр для адресса преед сохранением
      self.name = name.downcase
  end
end
