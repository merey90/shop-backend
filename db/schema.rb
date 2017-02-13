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

ActiveRecord::Schema.define(version: 20170206153414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_colors", force: :cascade do |t|
    t.string   "color"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_variety_id"
    t.text     "url"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["product_variety_id"], name: "index_product_images_on_product_variety_id", using: :btree
    t.index ["url"], name: "index_product_images_on_url", using: :btree
  end

  create_table "product_sizes", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_varieties", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "product_size_id"
    t.integer  "product_color_id"
    t.integer  "status",           limit: 2
    t.integer  "cost"
    t.integer  "tariff"
    t.integer  "sold_price"
    t.integer  "sold_tariff"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["cost"], name: "index_product_varieties_on_cost", using: :btree
    t.index ["product_color_id"], name: "index_product_varieties_on_product_color_id", using: :btree
    t.index ["product_id"], name: "index_product_varieties_on_product_id", using: :btree
    t.index ["product_size_id"], name: "index_product_varieties_on_product_size_id", using: :btree
    t.index ["sold_price"], name: "index_product_varieties_on_sold_price", using: :btree
    t.index ["sold_tariff"], name: "index_product_varieties_on_sold_tariff", using: :btree
    t.index ["status"], name: "index_product_varieties_on_status", using: :btree
    t.index ["tariff"], name: "index_product_varieties_on_tariff", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.text     "serial"
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.integer  "sale"
    t.boolean  "gender"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["description"], name: "index_products_on_description", using: :btree
    t.index ["gender"], name: "index_products_on_gender", using: :btree
    t.index ["price"], name: "index_products_on_price", using: :btree
    t.index ["product_type_id"], name: "index_products_on_product_type_id", using: :btree
    t.index ["sale"], name: "index_products_on_sale", using: :btree
    t.index ["serial"], name: "index_products_on_serial", using: :btree
    t.index ["title"], name: "index_products_on_title", using: :btree
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.date     "birthdate"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_infos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email",   null: false
    t.string   "uid",                    default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "email"
    t.string   "role",                   default: "regular", null: false
    t.json     "tokens"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role"], name: "index_users_on_role", using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "product_images", "product_varieties"
  add_foreign_key "product_varieties", "product_colors"
  add_foreign_key "product_varieties", "product_sizes"
  add_foreign_key "product_varieties", "products"
  add_foreign_key "products", "product_types"
  add_foreign_key "user_infos", "users"
end
