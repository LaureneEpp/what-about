class Post < ApplicationRecord

extend FriendlyId

    belongs_to :category

    validates :title, :content, presence: true
    validates :state, inclusion: { in: ['draft', 'published'] }
    validates :publisher, presence: true, if: :published?
    validates :published_at, presence: true, if: :published?

    friendly_id :title, use: [:slugged]

    def published?
        state == 'published'
    end
end