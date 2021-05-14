class Participant < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :user_id, inverse_of: :participants
  belongs_to :melange, inverse_of: :participants

  enum role: {organizer: 0, moderator: 5, guest: 10}
end
