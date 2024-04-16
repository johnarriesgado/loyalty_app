class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :currency

  validates :amount, numericality: { greater_than: 0 }
  validates :customer, :currency, presence: true

  after_create :add_customer_points

  private

  def add_customer_points
    if amount > 100
      points = calcualte_points(amount)
      if customer_peak_point?(points)
        customer.update(
          max_points: points,
          current_points: customer.current_points + points )
      else
        customer.update(current_points: customer.current_points + points)
      end
    end
  end

  def customer_peak_point?(points)
    points > customer.max_points
  end

  def calcualte_points(amount)
    return amount unless spent_in_foreign_currency?
    amount *= 2
  end

  def spent_in_foreign_currency?
    currency == Currency.default ? false : true
  end
end
