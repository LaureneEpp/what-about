class ApplicationController < ActionController::Base
  check_authorization
  skip_authorization_check if :devise_controller?
  before_action :authenticate_user!
  before_action :set_query

  include Pagy::Backend

  def set_query
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: "text/html" }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js { head :forbidden, content_type: "text/html" }
    end
  end
end
