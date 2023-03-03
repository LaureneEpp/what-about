class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  after_initialize :set_defaults
  has_one :publisher
  validates :first_name, :last_name, presence: true
  validates :username,
            uniqueness: true,
            presence: true,
            format: {
              with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/,
            }

  private

  def set_defaults
    # self.role ||= 'standard'
  end
end
