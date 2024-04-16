require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = Customer.create(full_name: "John Doe", birthday: "1990-01-01")
  end
  

  test "should get show" do
    # Make the GET request to the customer show endpoint
    get "/customers/#{@customer.id}"
    assert_response :success
    # TODO assert each field here
  end


  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { full_name: "John Doe", birthday: "1990-01-01" } }
    end

    assert_response :success
    assert_equal "John Doe", Customer.last.full_name
  end
end
