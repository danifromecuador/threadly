class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @new_post = Post.new
    @all_posts = Post.all.order(:created_at).reverse
    pp "##############################"
    pp @all_posts
  end
  
  def create
    @new_post = Post.new(post_params)
    redirect_to root_path if @new_post.save
  end

  private
  def post_params
    params.require(:post).permit(:comment)
  end

end
