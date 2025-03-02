class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @new_post = Post.new
    @all_posts = Post.all.order(:created_at).reverse
    pp "##############################"
    pp @all_posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to root_path
    else
      render :error, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.expect(post: [:comment])
  end

end
