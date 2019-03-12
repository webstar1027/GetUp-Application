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

ActiveRecord::Schema.define(version: 2019_03_07_231729) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "business_name"
    t.string "type_of_business"
    t.boolean "halal"
    t.string "district"
    t.text "address"
    t.string "coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "contact_email"
    t.string "contact_number"
    t.string "city"
    t.integer "country_id"
    t.string "post_code"
    t.string "description"
    t.string "person_charge_name"
    t.string "person_contact_number"
    t.string "other_business"
    t.boolean "vegan"
    t.boolean "outlet"
    t.string "social_link"
    t.string "operating_hours"
    t.index ["country_id"], name: "index_businesses_on_country_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.integer "deal_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "redeem"
    t.index ["deal_id"], name: "index_coupons_on_deal_id"
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiry_date"
    t.datetime "posted_date"
    t.string "status"
    t.integer "coupon_count"
    t.integer "coupon_claimed"
    t.integer "coupon_redeem_count"
    t.string "discount_type"
    t.boolean "exclusive"
    t.datetime "coupon_expiry_date"
    t.text "terms"
    t.integer "value_discount_remark"
    t.integer "percentage_discount_remark"
    t.string "free_gift_remart"
    t.boolean "super_deal"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landmarks", force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poi_id"
    t.index ["poi_id"], name: "index_landmarks_on_poi_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "placeable_id"
    t.string "placeable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pois", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coordinate"
    t.integer "popular"
    t.text "address"
    t.string "city"
    t.integer "country_id"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.index ["country_id"], name: "index_pois_on_country_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deal_id"
    t.boolean "pause", default: false
    t.string "location"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text "instructions"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.text "address"
    t.string "city"
    t.integer "country_id"
    t.boolean "quest_option"
    t.string "provider"
    t.string "uid"
    t.string "phone_num"
    t.integer "gender"
    t.integer "age"
    t.text "bio"
    t.integer "profile_mode", default: 0
    t.boolean "active", default: true
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
