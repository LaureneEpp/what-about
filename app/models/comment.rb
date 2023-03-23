class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(created_at: :asc) }

  # extend FriendlyId
  # friendly_id :post_id, use: :slugged

  def previous_date
    post.comments.ordered.where("created_at < ?", Time.now).last
  end
end
