class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  after_commit :add_default_avatar, on: %i[create update]
  before_save :assign_role

  belongs_to :role, optional: true
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users

  validates :first_name, :last_name, presence: true
  validates :username,
            uniqueness: true,
            presence: true,
            format: {
              with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/,
            }

  extend FriendlyId
  friendly_id :username, use: %i[finders slugged]

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

  def should_generate_new_friendly_id?
    username_changed?
  end

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [200, 200]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[first_name last_name username]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[posts]
  end

  private

  def add_default_avatar
    return if self.avatar.attached?
    avatar.attach(
      io:
        File.open(Rails.root.join("app", "assets", "images", "anonymous.jpg")),
      filename: "anonymous.jpg",
      content_type: "image/jpg",
    )
  end
end
