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

ActiveRecord::Schema.define(version: 20170719200520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string "identifier"
    t.string "title"
    t.string "sub_title"
    t.string "doc_type"
    t.string "size"
    t.string "version_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.string "address"
    t.string "npa"
    t.string "city"
    t.string "country"
    t.string "bill_option"
    t.string "client_name"
    t.string "client_address"
    t.string "client_npa"
    t.string "client_city"
    t.string "client_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "super_administrators", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_super_administrators_on_user_id"
  end

  create_table "user_managed_accesses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "company"
    t.string "discipline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.decimal "version_number"
    t.date "date"
    t.string "author"
    t.string "checker"
    t.string "crypted_id"
    t.boolean "current_version"
    t.text "comments"
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_versions_on_document_id"
    t.index ["user_id"], name: "index_versions_on_user_id"
  end

end
