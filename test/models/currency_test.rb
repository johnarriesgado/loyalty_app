require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test "should not save currency without name" do
    currency = Currency.new
    assert_not currency.save, "Saved the currency without a name"
  end
end
