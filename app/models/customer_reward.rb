class CustomerReward < ApplicationRecord
  belongs_to :customer
  belongs_to :reward

  validates :qty, numericality: { greater_than_or_equal_to: 0 }
  validates :redeemed_qty, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :customer, :reward, presence: true
end
