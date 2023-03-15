class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]

  load_and_authorize_resource :posts
  load_and_authorize_resource :comment, through: :post

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to post_path(@post),
                      notice: "Comment was successfully created."
        end
        format.turbo_stream do
          flash.now[:notice] = "Comment was successfully created."
        end
      end
      redirect_to post_path(@post), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html do
          redirect_to post_path(@post),
                      notice: "Comment was successfully updated."
        end
        format.turbo_stream do
          flash.now[:notice] = "Comment was successfully updated."
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html do
        redirect_to post_path(@post),
                    notice: "Comment was successfully destroyed."
      end
      format.turbo_stream do
        flash.now[:notice] = "Comment was successfully destroyed."
      end
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
