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

class UsersController < ApplicationController
  include Authenticatable

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
    @photo = current_user.photos.build if current_user
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
end

