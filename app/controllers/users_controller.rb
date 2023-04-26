class UsersController < ApplicationController
  before_action :set_user, only: %i[show profile account]

  def index
    # @users = User.where(role_id: 2)
    @users = User.all.excluding(current_user)
  end

  def show
    @users = User.all.excluding(current_user)

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
    @user.avatar.attach(params[:avatar])
    @followees_count = Follow.where(followee_id: @user).count
    @posts_count = Post.where(user_id: @user).count
    @posts = @user.posts.order(created_at: :desc)
  end

  def account
    @posts = @user.posts.order(created_at: :desc)
    @followers = Follow.where(followee_id: current_user.id)
    @followers_count = @followers.count
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
