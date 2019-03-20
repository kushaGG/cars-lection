class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_photo, only: [:show, :edit, :update]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:notice] = "photo successfully created"
      redirect_to photo_path(@photo.id)
    else
      flash[:error] = "photo has error with created"
      render 'new'
    end
  end

  def show

  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end
private
def photo_params
  params.require(:photo).permit(:user_id, :category_id, :title, {images: []});
end

def find_photo
  @photo = Photo.find_by(id: params[:id])
end
end
