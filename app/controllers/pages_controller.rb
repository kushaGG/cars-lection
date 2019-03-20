class PagesController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5).order('id DESC')
    @profiles = Profile.all
  end
end
