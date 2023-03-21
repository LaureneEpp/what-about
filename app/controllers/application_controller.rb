class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_query
  skip_authorization_check unless: :devise_controller?

  def set_query
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  # rescue_from CanCan::AccessDenied do |exception|
  #   if current_user.nil?
  #     session[:next] = request.fullpath
  #     # redirect_to login_url, alert: "You have to log in to continue."
  #   else
  #     respond_to do |format|
  #       format.json { render nothing: true, status: :not_found }
  #       format.html { redirect_to main_app.root_url, alert: exception.message }
  #       format.js { render nothing: true, status: :not_found }
  #     end
  #   end
  # end
end
