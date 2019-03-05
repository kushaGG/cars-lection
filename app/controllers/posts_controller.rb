class PostsController < InheritedResources::Base
  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    else
      flash[:error] = "Post has error with created"
      render 'new'
    end
  end

  def show
    #code
  end

  def edit
    #code
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to post_path(@post.id)
    else
      flash[:error] = "Post has error with created"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end

    def find_post
      @post = Post.find_by(id: params[:id])
    end
end
