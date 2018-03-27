# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180306110015) do

  create_table "admins", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "address"
    t.integer "phone", limit: 8
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "type"
    t.integer "stations"
    t.integer "station_id"
    t.integer "company_id"
    t.integer "sub_no"
    t.integer "zone_id"
    t.string "slug"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_admins_on_slug", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "phone", limit: 8
    t.integer "integer", limit: 8
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id"
    t.integer "companyadmin_id"
    t.string "slug"
    t.index ["admin_id"], name: "index_companies_on_admin_id"
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_products_on_slug", unique: true
    t.index ["station_id"], name: "index_products_on_station_id"
  end

  create_table "pumps", force: :cascade do |t|
    t.string "name"
    t.integer "station_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["product_id"], name: "index_pumps_on_product_id"
    t.index ["slug"], name: "index_pumps_on_slug", unique: true
    t.index ["station_id"], name: "index_pumps_on_station_id"
  end

  create_table "sales_reports", force: :cascade do |t|
    t.integer "station_id"
    t.integer "stock_id"
    t.integer "product_id"
    t.string "pump_attendant_name"
    t.integer "pump_attendat_phone", limit: 8
    t.integer "integer", limit: 8
    t.float "met_at_reading"
    t.float "left_at_reading"
    t.float "sold_capacity"
    t.float "estimate_amount"
    t.float "amount_brought"
    t.integer "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cost_price"
    t.integer "pump_id"
    t.float "track"
    t.string "slug"
    t.integer "admin_id"
    t.index ["product_id"], name: "index_sales_reports_on_product_id"
    t.index ["slug"], name: "index_sales_reports_on_slug", unique: true
    t.index ["stock_id"], name: "index_sales_reports_on_stock_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "state"
    t.string "city"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zone_id"
    t.string "slug"
    t.index ["company_id"], name: "index_stations_on_company_id"
    t.index ["slug"], name: "index_stations_on_slug", unique: true
  end

  create_table "stock_tanks", force: :cascade do |t|
    t.integer "stock_id"
    t.integer "integer", limit: 8
    t.float "sold_capacity"
    t.float "sold_amount"
    t.float "cost_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "stock_capacity"
    t.string "slug"
    t.index ["slug"], name: "index_stock_tanks_on_slug", unique: true
    t.index ["stock_id"], name: "index_stock_tanks_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.text "description"
    t.integer "station_id"
    t.integer "integer", limit: 8
    t.integer "product_id"
    t.string "supplier"
    t.float "cost_price"
    t.float "cost_per_ltr"
    t.float "selling_price_per_ltr"
    t.float "estimate_profit_percent"
    t.float "estimate_profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "estimated_sales_price"
    t.float "tank_capacity"
    t.float "stock_capacity"
    t.integer "pump_id"
    t.string "slug"
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["slug"], name: "index_stocks_on_slug", unique: true
    t.index ["station_id"], name: "index_stocks_on_station_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.integer "station_id"
    t.integer "product_id"
    t.integer "total_capacity", limit: 8
    t.integer "integer", limit: 8
    t.integer "used_capacity", limit: 8
    t.integer "free_capacity", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pump_id"
    t.string "slug"
    t.index ["slug"], name: "index_tanks_on_slug", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["company_id"], name: "index_zones_on_company_id"
    t.index ["slug"], name: "index_zones_on_slug", unique: true
  end

end
