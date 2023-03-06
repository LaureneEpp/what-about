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
    @post.publisher_id = current_user.publisher.id

    if @post.save
      respond_to do |format|
        format.html do
          redirect_to posts_path, notice: "Post was successfully created."
        end
        format.turbo_stream do
          flash.now[:notice] = "Post was successfully created."
        end
      end
    else
      # render :new, status: :unprocessable_entity
      render :news
    end
  end

  # PATCH/PUT /posts/1
  # def update
  #   if @post.update(post_params)
  #     redirect_to post_path(@post), notice: "Post was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def update
    if @post.update(quote_params)
      respond_to do |format|
        format.html do
          redirect_to posts_path, notice: "Post was successfully updated."
        end
        format.turbo_stream do
          flash.now[:notice] = "Post was successfully updated."
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    # redirect_to posts_url, notice: "Post was successfully destroyed."

    respond_to do |format|
      format.html do
        redirect_to quotes_path, notice: "Post was successfully destroyed."
      end
      format.turbo_stream do
        flash.now[:notice] = "Post was successfully destroyed."
      end
    end
    # respond_to do |format|
    #   format.html do
    #     redirect_to posts_url, notice: "Post was successfully destroyed."
    #   end
    #   format.turbo_stream
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :title,
      :subtitle,
      :content,
      :image,
      :publisher_id,
      :category_id,
      :image,
    )
  end
end
