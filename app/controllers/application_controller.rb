class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_profile
  private
  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end
end
