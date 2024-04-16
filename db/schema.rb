# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_15_220721) do
  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_rewards", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "qty", default: 1
    t.integer "redeemed_qty", default: 0
    t.integer "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_rewards_on_customer_id"
    t.index ["reward_id"], name: "index_customer_rewards_on_reward_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.integer "current_points", default: 0
    t.integer "max_points", default: 0
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.decimal "amount"
    t.integer "currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_transactions_on_currency_id"
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
  end

  add_foreign_key "customer_rewards", "customers"
  add_foreign_key "customer_rewards", "rewards"
  add_foreign_key "transactions", "currencies"
  add_foreign_key "transactions", "customers"
end
