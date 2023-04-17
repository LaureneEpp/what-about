class Room < ApplicationRecord
  scope :public_rooms, -> { where(is_private: false) }
  # after_create_commit { broadcast_append_to "rooms" }
  after_create_commit { broadcast_if_public }
  after_destroy_commit { broadcast_remove_to "rooms" }

  # extend FriendlyId
  # friendly_id :name, use: %i[finders slugged]

  validates_uniqueness_of :name
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  def broadcast_if_public
    broadcast_append_to "rooms" unless is_private
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id)
    end
    single_room
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
