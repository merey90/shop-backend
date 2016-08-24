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

ActiveRecord::Schema.define(version: 20160823160900) do

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
    t.index ["product_variety_id"], name: "index_product_images_on_product_variety_id"
    t.index ["url"], name: "index_product_images_on_url"
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
    t.integer  "status",           limit: 1
    t.integer  "cost"
    t.integer  "tariff"
    t.integer  "sold_price"
    t.integer  "sold_tariff"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["cost"], name: "index_product_varieties_on_cost"
    t.index ["product_color_id"], name: "index_product_varieties_on_product_color_id"
    t.index ["product_id"], name: "index_product_varieties_on_product_id"
    t.index ["product_size_id"], name: "index_product_varieties_on_product_size_id"
    t.index ["sold_price"], name: "index_product_varieties_on_sold_price"
    t.index ["sold_tariff"], name: "index_product_varieties_on_sold_tariff"
    t.index ["status"], name: "index_product_varieties_on_status"
    t.index ["tariff"], name: "index_product_varieties_on_tariff"
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
    t.index ["description"], name: "index_products_on_description"
    t.index ["gender"], name: "index_products_on_gender"
    t.index ["price"], name: "index_products_on_price"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["sale"], name: "index_products_on_sale"
    t.index ["serial"], name: "index_products_on_serial"
    t.index ["title"], name: "index_products_on_title"
  end

end
