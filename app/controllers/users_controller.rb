class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
    @users = User.friendly.all.excluding(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(current_user, @user)
    @single_room =
      Room.where(name: @room_name).first ||
        Room.create_private_room([@user, current_user], @room_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render "rooms/index"
  end

  def profile
    @user = User.friendly.find(params[:id])
    @posts = Post.where(user_id: @user).count
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
