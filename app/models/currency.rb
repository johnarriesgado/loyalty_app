class Currency < ApplicationRecord
  has_many :transactions

  validates :name, presence: true

  scope :default, -> { find_by(name: "US Dollar") }
end
