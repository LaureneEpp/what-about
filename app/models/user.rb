class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  extend FriendlyId
  friendly_id :username

  # after_initialize :set_defaults
  before_save :assign_role
  # has_one :publisher
  belongs_to :role, optional: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :username,
            uniqueness: true,
            presence: true,
            format: {
              with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/,
            }

  def fullname
    "#{first_name} #{last_name}"
  end

  def assign_role
    self.role = Role.find_by name: "standard" if role.nil?
  end

  def publisher?
    self.role.name == "publisher" if self.role.present?
  end

  def standard?
    self.role.name == "standard" if self.role.present?
  end

  def admin?
    self.role.name == "admin" if self.role.present?
  end
end
