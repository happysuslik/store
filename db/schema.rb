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

ActiveRecord::Schema.define(version: 20150214174659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text     "address"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.integer  "stock"
    t.integer  "category_id"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text     "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "number"
    t.integer  "ccv"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "users_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "credit_cards", ["users_id"], name: "index_credit_cards_on_users_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "price"
    t.integer  "quantity"
  end

  add_index "line_items", ["book_id"], name: "index_line_items_on_book_id", using: :btree
  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "amount"
    t.datetime "completed_date"
    t.string   "state"
    t.integer  "users_id"
    t.integer  "credit_card_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
  add_index "orders", ["users_id"], name: "index_orders_on_users_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.text     "review"
    t.integer  "rating"
    t.integer  "users_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id", using: :btree
  add_index "ratings", ["users_id"], name: "index_ratings_on_users_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "line_items", "books"
  add_foreign_key "line_items", "carts"
end
