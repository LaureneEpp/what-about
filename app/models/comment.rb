class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(created_at: :asc) }

  def previous_date
    post.comments.ordered.where("created_at < ?", Time.now).last
  end
end
