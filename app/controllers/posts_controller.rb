class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy]

  require "mini_magick"

  # GET /posts
  def index
    @posts = Post.all.order("created_at DESC")
    @pagy, @posts = pagy((@posts))
    # rescue Pagy::OverflowError
    #   redirect_to posts_path(page: 1)
    # params[:page] = 1
    # retry
  end

  # GET /posts/1
  def show
    @comments = @post.comments.ordered
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      respond_to do |format|
        format.html do
          redirect_to posts_path, notice: "Post was successfully created."
        end
        format.turbo_stream do
          # flash.now[:notice] = "Post was successfully created."
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html do
          redirect_to post_path(@post), notice: "Post was successfully updated."
        end
        format.turbo_stream do
          # flash.now[:notice] = "Post was successfully updated."
          redirect_to post_path(@post), notice: "Post was successfully updated."
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    respond_to do |format|
      format.html do
        redirect_to quotes_path, notice: "Post was successfully destroyed."
      end
      format.turbo_stream {}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :title,
      :subtitle,
      :content,
      :image,
      :user_id,
      :category_id,
      :user_id,
    )
  end
end
