class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to post_path(@post),
                      notice: "Comment was successfully created."
        end
        format.turbo_stream do
          flash.now[:notice] = "Comment was successfully created."
          redirect_to post_path(@post),
                      notice: "Comment was successfully updated."
        end
      end
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
          redirect_to post_path(@post),
                      notice: "Comment was successfully updated."
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
        redirect_to post_path(@post),
                    notice: "Comment was successfully destroyed."
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
    params.require(:comment).permit(:name, :body, :user_id, :post_id)
  end
end
