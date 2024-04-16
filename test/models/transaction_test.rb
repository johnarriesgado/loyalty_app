require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  setup do
    @currency = Currency.create(name: "US Dollar")
  end

  test "should be valid" do
    customer = Customer.create(full_name: "John Doe", birthday: "1990-01-01")
    transaction = Transaction.new(amount: 100, currency: @currency, customer: customer)
    assert transaction.valid?
  end

  test "should require amount" do
    transaction = Transaction.new(currency: @currency)
    assert_not transaction.valid?
  end

  test "should require currency" do
    transaction = Transaction.new(amount: 100)
    assert_not transaction.valid?
  end

  test "should require customer" do
    transaction = Transaction.new(amount: 100, currency: @currency)
    assert_not transaction.valid?
  end
end
