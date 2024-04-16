class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.integer :current_points, default: 0
      t.integer :max_points, default: 0
      t.date :birthday

      t.timestamps
    end
  end
end
