class Melange < ApplicationRecord
  has_many :participants, inverse_of: :melange, dependent: :delete_all
  has_many :users, through: :participants

  validates :name, presence: true
  validates :event_date, presence: true
end
