class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.public_rooms
    @users = User.friendly.all.excluding(current_user)
  end
end
