class Publisher < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  has_many :posts

  def fullname
    "#{@user.first_name} #{@user_id.last_name}"
  end

  private

  def set_defaults
    self.first_name = @user.first_name
    self.last_name = @user.last_name
  end
end
