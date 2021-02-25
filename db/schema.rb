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

ActiveRecord::Schema.define(version: 2021_02_22_084043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_flows", force: :cascade do |t|
    t.string "transact_type"
    t.bigint "wallet_id"
    t.datetime "transact_at"
    t.decimal "cash", precision: 15, scale: 2
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wallet_id"], name: "index_cash_flows_on_wallet_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.decimal "rate"
    t.integer "multiplicity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "name"
    t.bigint "currency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_invoices_on_currency_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.bigint "currency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
  end

  add_foreign_key "cash_flows", "wallets"
  add_foreign_key "invoices", "currencies"
  add_foreign_key "wallets", "currencies"
end
