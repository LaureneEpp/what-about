class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_query

  def set_query
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  rescue_from CanCan::AccessDenied do
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
end
