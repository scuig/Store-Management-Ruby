# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141123193231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: true do |t|
    t.string   "name"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_purchases", id: false, force: true do |t|
    t.integer  "material_id", null: false
    t.integer  "purchase_id", null: false
    t.integer  "units"
    t.date     "exp_date"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "material_purchases", ["material_id"], name: "index_material_purchases_on_material_id", using: :btree
  add_index "material_purchases", ["purchase_id"], name: "index_material_purchases_on_purchase_id", using: :btree

  create_table "materials", force: true do |t|
    t.decimal  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
    t.string   "name"
  end

  create_table "product_categories", id: false, force: true do |t|
    t.integer  "product_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "product_materials", id: false, force: true do |t|
    t.integer  "product_id",  null: false
    t.integer  "material_id", null: false
    t.decimal  "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_materials", ["material_id"], name: "index_product_materials_on_material_id", using: :btree
  add_index "product_materials", ["product_id"], name: "index_product_materials_on_product_id", using: :btree

  create_table "product_sales", id: false, force: true do |t|
    t.integer  "product_id",  null: false
    t.integer  "sale_id",     null: false
    t.integer  "discount_id"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_sales", ["product_id"], name: "index_product_sales_on_product_id", using: :btree
  add_index "product_sales", ["sale_id"], name: "index_product_sales_on_sale_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.date     "purchase_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "supplier_id"
  end

  create_table "sales", force: true do |t|
    t.date     "saleDate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "user_id"
  end

  create_table "suppliers", force: true do |t|
    t.text     "name"
    t.text     "address"
    t.text     "email"
    t.text     "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.text     "name"
    t.text     "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: false, force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "salt"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "id",                     default: 0, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
