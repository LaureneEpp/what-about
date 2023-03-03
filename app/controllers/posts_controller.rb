class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  require "mini_magick"

  # GET /posts
  def index
    @posts = Post.all.order("created_at DESC")
  end

  # GET /posts/1
  def show
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
    @post.publisher_id = current_user.publisher

    respond_to do |format|
      if @post.save
        redirect_to @post, notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      redirect_to posts_url, notice: "Post was successfully destroyed."
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
      :content,
      :image,
      :publisher_id,
      :category_id,
      :image,
    )
  end
end
