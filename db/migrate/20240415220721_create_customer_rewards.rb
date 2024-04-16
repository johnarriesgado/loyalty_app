class CreateCustomerRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_rewards do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :qty, default: 1
      t.integer :redeemed_qty, default: 0
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
