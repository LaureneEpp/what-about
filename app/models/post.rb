class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[finders slugged]

  belongs_to :category
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  end
  has_many :comments, dependent: :destroy
  # has_many_attached :pictures
  # has_rich_text :body

  validates :title, :subtitle, :content, presence: true
  validates :subtitle,
            length: {
              maximum: 80,
              too_long: "%{count} characters is the maximum allowed",
            }
  validates :state, inclusion: { in: %w[draft published] }
  # validates :publisher, presence: true, if: :published?
  validates :published_at, presence: true, if: :published?

  def published?
    state == "published"
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[category subtitle title user]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category user]
  end

  private

  # def set_defaults
  # end
end
