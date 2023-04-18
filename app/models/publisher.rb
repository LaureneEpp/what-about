class Publisher < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  # has_many :posts

  def fullname
    "#{first_name} #{last_name}"
  end
end
