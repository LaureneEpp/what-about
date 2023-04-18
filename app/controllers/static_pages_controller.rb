class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
    # @posts = Post.accessible_by(current_ability)
  end

  def dashboard
    # @posts = Post.accessible_by(current_ability)
  end
end
