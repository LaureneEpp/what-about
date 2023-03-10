class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_query

  def set_query
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
