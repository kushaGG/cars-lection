class PagesController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 3)
    @profiles = Profile.all
  end
end
