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

ActiveRecord::Schema[8.1].define(version: 2026_04_29_192232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "diets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "meal_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "meal_id", null: false
    t.string "name"
    t.string "quantity"
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_items_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "diet_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["diet_id"], name: "index_meals_on_diet_id"
  end

  create_table "users", force: :cascade do |t|
    t.float "abdominal_circumference"
    t.integer "age"
    t.string "city"
    t.datetime "created_at", null: false
    t.float "current_weight"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.boolean "has_complete_info", default: false, null: false
    t.float "height"
    t.text "main_discomfort"
    t.integer "main_goal"
    t.boolean "measured_with_tape", default: false
    t.text "measurement_notes"
    t.string "profession"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0, null: false
    t.integer "sex"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "work_routine"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diets", "users"
  add_foreign_key "meal_items", "meals"
  add_foreign_key "meals", "diets"
end
