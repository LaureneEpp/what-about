class FollowsController < ApplicationController
  def index
    @followers = Follow.where(followee_id: current_user.id)
    @followers_count = @followers.count
  end
end
