class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[finders slugged]

  belongs_to :category
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 150]
  end
  has_many :comments, dependent: :destroy
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

  after_commit :add_default_image, on: %i[create update]

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

  def image_thumbnail
    image.variant(resize_to_limit: [200, 150]).processed
  end

  private

  def add_default_image
    return if self.image.attached?
    image.attach(
      io:
        File.open(Rails.root.join("app", "assets", "images", "landscape.jpg")),
      filename: "landscape.jpg",
      content_type: "image/jpg",
    )
  end
end
