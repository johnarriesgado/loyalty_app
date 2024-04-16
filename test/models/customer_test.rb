class CustomerTest < ActiveSupport::TestCase
  test "should be valid" do
    customer = Customer.new(full_name: "John Doe", birthday: "1990-01-01")
    assert customer.valid?
  end

  test "should require full_name" do
    customer = Customer.new(birthday: "1990-01-01")
    assert_not customer.valid?
  end

  test "should require birthday" do
    customer = Customer.new(full_name: "John Doe")
    assert_not customer.valid?
  end
end