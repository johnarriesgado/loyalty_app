# frozen_string_literal: true
class Customer < ApplicationRecord
  has_many :transactions
  has_many :customer_rewards
  has_many :rewards, through: :customer_rewards

  validates :full_name, presence: true
  validates :birthday, presence: true, format: {
    with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in mm-dd-yyyy format"
  }

  scope :is_new?, -> { where("created_at >= ?", 60.days.ago) }

  TIER = { standard: 0, gold: 1000, platinum: 5000 }

  def loyalty_tier
    current_tier = TIER.find { |_, threshold| current_points < threshold }
    current_tier ? current_tier.first.to_s.capitalize : 'Platinum'
  end
end
