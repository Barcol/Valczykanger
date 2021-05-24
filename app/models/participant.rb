class Participant < ApplicationRecord
  include TranslateEnum

  belongs_to :user, class_name: "User", foreign_key: :user_id, inverse_of: :participants
  belongs_to :melange, inverse_of: :participants

  enum role: { organizer: "organizer", moderator: "moderator", guest: "guest" }
  translate_enum :role
end
