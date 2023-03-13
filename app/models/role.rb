class Role < ApplicationRecord
  enum :name, { standard: 0, publisher: 1, admin: 2 }
  has_many :users
end
