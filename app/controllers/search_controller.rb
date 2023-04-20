class SearchController < ApplicationController
  def index
    # @q = Post.ransack(params[:q])
    # @posts = @q.result(distinct: true)
    @categories = @posts.map { |p| p.category }.uniq.sort
    @users = @posts.map { |p| p.user }.uniq.sort
  end
end
