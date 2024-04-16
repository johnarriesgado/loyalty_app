require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @customer = Customer.create(full_name: "John Doe", birthday: "1990-01-01")
    @currency = Currency.create(name: "US Dollar")
    @transaction = transactions(:one)
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { amount: 100, currency_id: @currency.id, customer_id: @customer.id } }
    end

    assert_response :success
    assert_equal 100, Transaction.last.amount
    assert_equal @customer, Transaction.last.customer
  end
end
