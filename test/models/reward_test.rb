require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  test "should not save reward without name" do
    reward = Reward.new
    assert_not reward.save, "Saved the reward without a name"
  end
end
