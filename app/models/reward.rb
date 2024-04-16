class Reward < ApplicationRecord
  has_many :customer_rewards
  has_many :customers, through: :customer_rewards

  validates :name, presence: true
end
