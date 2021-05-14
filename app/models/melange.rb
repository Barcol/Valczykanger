class Melange < ApplicationRecord
  has_many :participants, inverse_of: :melange
  has_many :users, class_name: "User", through: :participants

  validates :name, presence: true
  validates :event_date, presence: true
end
