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

ActiveRecord::Schema.define(version: 20150918150848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_ingredients", force: :cascade do |t|
    t.float    "quantity"
    t.float    "per_measure"
    t.integer  "dish_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "unit"
    t.string   "per_measure_unit"
  end

  add_index "dish_ingredients", ["dish_id"], name: "index_dish_ingredients_on_dish_id", using: :btree
  add_index "dish_ingredients", ["ingredient_id"], name: "index_dish_ingredients_on_ingredient_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drv_profiles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drvs", force: :cascade do |t|
    t.float    "quantity"
    t.integer  "nutrient_id"
    t.integer  "drv_profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "unit"
  end

  add_index "drvs", ["drv_profile_id"], name: "index_drvs_on_drv_profile_id", using: :btree
  add_index "drvs", ["nutrient_id"], name: "index_drvs_on_nutrient_id", using: :btree

  create_table "ingredient_nutrients", force: :cascade do |t|
    t.float    "quantity"
    t.float    "per_measure"
    t.integer  "nutrient_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "unit"
    t.string   "per_measure_unit"
  end

  add_index "ingredient_nutrients", ["ingredient_id"], name: "index_ingredient_nutrients_on_ingredient_id", using: :btree
  add_index "ingredient_nutrients", ["nutrient_id"], name: "index_ingredient_nutrients_on_nutrient_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ndbno"
  end

  create_table "intakes", force: :cascade do |t|
    t.float    "serving"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "intakes", ["dish_id"], name: "index_intakes_on_dish_id", using: :btree
  add_index "intakes", ["user_id"], name: "index_intakes_on_user_id", using: :btree

  create_table "nutrient_lists", force: :cascade do |t|
    t.float    "quantity"
    t.float    "per_measure"
    t.integer  "nutrient_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "nutrient_lists", ["ingredient_id"], name: "index_nutrient_lists_on_ingredient_id", using: :btree
  add_index "nutrient_lists", ["nutrient_id"], name: "index_nutrient_lists_on_nutrient_id", using: :btree

  create_table "nutrients", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "ndb_nutrient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.float    "weight"
    t.float    "height"
    t.integer  "drv_profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "users", ["drv_profile_id"], name: "index_users_on_drv_profile_id", using: :btree

  add_foreign_key "dish_ingredients", "dishes"
  add_foreign_key "dish_ingredients", "ingredients"
  add_foreign_key "drvs", "drv_profiles"
  add_foreign_key "drvs", "nutrients"
  add_foreign_key "ingredient_nutrients", "ingredients"
  add_foreign_key "ingredient_nutrients", "nutrients"
  add_foreign_key "intakes", "dishes"
  add_foreign_key "intakes", "users"
  add_foreign_key "nutrient_lists", "ingredients"
  add_foreign_key "nutrient_lists", "nutrients"
  add_foreign_key "users", "drv_profiles"
end
