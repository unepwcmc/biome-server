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

ActiveRecord::Schema.define(version: 20150917090924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "field_values", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description", default: ""
    t.integer  "value"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description", default: ""
    t.integer  "layer_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layers", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layers_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "layer_id"
  end

  add_index "layers_projects", ["layer_id"], name: "index_layers_projects_on_layer_id", using: :btree
  add_index "layers_projects", ["project_id"], name: "index_layers_projects_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
