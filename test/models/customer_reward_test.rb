require 'test_helper'

class CustomerRewardTest < ActiveSupport::TestCase
  test "should not save customer reward without quantity" do
    customer_reward = CustomerReward.new
    assert_not customer_reward.save, "Saved the customer reward without a quantity"
  end
end
