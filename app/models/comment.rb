class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :name, :body, presence: true
  validates :name,
            length: {
              maximum: 30,
              too_long: "%{count} characters is the maximum allowed",
            }

  scope :ordered, -> { order(created_at: :asc) }

  def previous_date
    post.comments.ordered.where("created_at < ?", Time.now).last
  end
end
