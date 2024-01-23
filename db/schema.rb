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

ActiveRecord::Schema[7.0].define(version: 2024_01_21_112906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string "title"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "engine"
    t.string "chassis"
    t.integer "races_won"
    t.integer "pole_positions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "podiums"
    t.string "championship_place"
    t.string "battery"
    t.integer "horsepower"
    t.integer "weight"
    t.string "fuel"
    t.string "lubricants"
    t.string "description"
    t.string "team_slug"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "post_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devise_api_tokens", force: :cascade do |t|
    t.string "resource_owner_type", null: false
    t.bigint "resource_owner_id", null: false
    t.string "access_token", null: false
    t.string "refresh_token"
    t.integer "expires_in", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_devise_api_tokens_on_access_token"
    t.index ["previous_refresh_token"], name: "index_devise_api_tokens_on_previous_refresh_token"
    t.index ["refresh_token"], name: "index_devise_api_tokens_on_refresh_token"
    t.index ["resource_owner_type", "resource_owner_id"], name: "index_devise_api_tokens_on_resource_owner"
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
    t.integer "team_id"
    t.string "slug"
    t.string "team_slug"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "team_slug"
    t.string "description"
    t.string "image_url"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like", default: 0
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
    t.string "team_color"
    t.string "slug"
    t.text "description"
  end

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "country"
    t.string "city"
    t.integer "length"
    t.integer "turns"
    t.integer "first_grand_prix"
    t.float "lap_record_in_seconds"
    t.string "lap_record"
    t.boolean "is_street_circuit"
    t.string "description"
    t.string "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.boolean "admin", default: false
    t.string "username"
    t.string "keresztnev"
    t.string "vezeteknev"
    t.string "fav_team"
    t.string "fav_driver"
    t.boolean "banned", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
end
