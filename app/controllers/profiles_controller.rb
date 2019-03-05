class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit, :update]
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = "profile successfully created"
      redirect_to profile_path(@profile.id)
    else
      flash[:error] = "Post has error with created"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update
      flash[:notice] = "profile successfully edited"
      redirect_to profile_path(@profile.id)
    else
      flash[:error] = "Post has error with edited"
      render 'new'
    end
  end
private
  def profile_params
    params.require(:profile).permit(:user_id, :nickname, :country, :avatar);
  end

  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end
end
