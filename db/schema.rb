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

ActiveRecord::Schema.define(version: 20150423115959) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price",      precision: 15, scale: 2
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "user_id"
    t.text     "address"
    t.integer  "status"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",              precision: 15, scale: 2
    t.integer  "weight"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.text     "adress"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
