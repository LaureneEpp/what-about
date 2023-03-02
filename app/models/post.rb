class Post < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  has_one :publisher
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  end

  # has_many_attached :pictures
  # has_rich_text :body

  validates :title, :subtitle, :content, presence: true
  validates :subtitle,
            length: {
              maximum: 80,
              too_long: "%{count} characters is the maximum allowed",
            }
  validates :state, inclusion: { in: %w[draft published] }
  validates :publisher, presence: true, if: :published?
  validates :published_at, presence: true, if: :published?

  friendly_id :title, use: [:slugged]

  def published?
    state == "published"
  end

  private

  def set_defaults
  end
end
