class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def dashboard
  end
end
