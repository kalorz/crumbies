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

ActiveRecord::Schema.define(version: 20161023142033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "entries", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "journal_id",                 null: false
    t.string   "caption"
    t.datetime "timestamp"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sections_count", default: 0, null: false
    t.index ["journal_id"], name: "index_entries_on_journal_id", using: :btree
  end

  create_table "entry_sections", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "entry_id",                   null: false
    t.string   "component_type",             null: false
    t.uuid     "component_id",               null: false
    t.integer  "position",       default: 1, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["component_type", "component_id"], name: "index_entry_sections_on_component_type_and_component_id", unique: true, using: :btree
    t.index ["entry_id"], name: "index_entry_sections_on_entry_id", using: :btree
  end

  create_table "journals", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "entries_count", default: 0, null: false
  end

  create_table "text_components", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text     "body"
    t.text     "formatted_body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "entries", "journals", on_delete: :restrict
  add_foreign_key "entry_sections", "entries", on_delete: :restrict
end
