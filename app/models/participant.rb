class Attendance < ApplicationRecord
  has_many :users, inverse_of: :participants
  has_many :melanges, inverse_of: :participants

  enum role: {organizer: 0, moderator: 5, guest: 10}
end
