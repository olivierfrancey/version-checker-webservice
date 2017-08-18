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

ActiveRecord::Schema.define(version: 20170818065150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string "role"
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "documents", force: :cascade do |t|
    t.string "identifier"
    t.string "title"
    t.string "sub_title"
    t.string "doc_type"
    t.string "size"
    t.string "last_version", default: "-"
    t.date "last_version_date"
    t.integer "user_id"
    t.integer "project_id"
    t.integer "group_id"
    t.integer "qr_code_position_id"
    t.integer "versions_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "project_id"
    t.integer "documents_count", default: 0
    t.integer "versions_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "action"
    t.string "model"
    t.integer "user_id"
    t.integer "object_id"
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
    t.string "client_name"
    t.string "client_address"
    t.string "client_npa"
    t.string "client_city"
    t.string "client_country"
    t.integer "user_id"
    t.integer "groups_count", default: 0
    t.integer "documents_count", default: 0
    t.integer "versions_count", default: 0
    t.integer "accesses_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qr_code_positions", force: :cascade do |t|
    t.integer "page"
    t.integer "x"
    t.integer "y"
    t.integer "size"
    t.string "name"
    t.integer "user_id"
    t.integer "documents_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "company"
    t.string "discipline"
    t.boolean "active", default: true
    t.boolean "super_admin", default: false
    t.integer "projects_count", default: 0
    t.integer "documents_count", default: 0
    t.integer "groups_count", default: 0
    t.integer "versions_count", default: 0
    t.integer "accesses_count", default: 0
    t.integer "qr_code_positions_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "version_number"
    t.date "date"
    t.string "author"
    t.string "checker"
    t.string "encrypted_id"
    t.boolean "current_version", default: true
    t.text "comments"
    t.string "pdf_file"
    t.string "dxf_file"
    t.string "pdf_file_name"
    t.string "dxf_file_name"
    t.integer "user_id"
    t.integer "project_id"
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.string "qrcode"
  end

end
