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

class PhotosController < ApplicationController
  include Authenticatable
  
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @photo = Photos::Create.run!(params[:photo].merge( user: current_user))
    redirect_to current_user, notice: "Фото добавлено"
  end

  def destroy
    @photo.destroy
    redirect_to current_user || root_url, notice: "Фото было удалено"
  end
  
  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.paginate(page: params[:page], per_page: 5)
  end

  private

  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
    redirect_to current_user if @photo.nil?
  end
end
