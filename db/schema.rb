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

ActiveRecord::Schema[7.0].define(version: 2023_10_24_171901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "number"
    t.integer "height"
    t.string "nationality"
    t.integer "number_of_championships"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_wins"
    t.integer "number_of_podiums"
    t.integer "series_id"
    t.text "description"
    t.binary "profile_picture"
    t.integer "team_id"
    t.string "slug"
    t.string "team_slug"
  end

  create_table "examples", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.binary "image_url"
    t.string "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "team_slug"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_drivers"
    t.integer "number_of_races"
    t.integer "number_of_teams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_championships"
    t.integer "number_of_races"
    t.string "headquarters_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "technical_director"
    t.integer "first_win"
    t.integer "last_championship_win"
    t.integer "date_of_establishment"
    t.integer "series_id"
    t.binary "team_picture"
    t.string "team_color"
    t.string "slug"
  end

end
