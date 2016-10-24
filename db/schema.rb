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

ActiveRecord::Schema.define(version: 20161023202701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "journals", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "stories_count", default: 0, null: false
  end

  create_table "media", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "media_component_id",             null: false
    t.string   "caption"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.string   "file_url"
    t.integer  "position",           default: 1, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["media_component_id"], name: "index_media_on_media_component_id", using: :btree
  end

  create_table "media_components", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "media_count", default: 0, null: false
  end

  create_table "milestone_categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "caption"
    t.text     "description"
    t.text     "formatted_description"
    t.string   "color"
    t.integer  "position",              default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "milestone_types_count", default: 0, null: false
  end

  create_table "milestone_types", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "milestone_category_id",             null: false
    t.string   "caption"
    t.text     "description"
    t.text     "formatted_description"
    t.integer  "minimum_months"
    t.integer  "maximum_months"
    t.integer  "position",              default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["milestone_category_id"], name: "index_milestone_types_on_milestone_category_id", using: :btree
  end

  create_table "stories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "journal_id",              null: false
    t.string   "caption"
    t.datetime "timestamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "parts_count", default: 0, null: false
    t.index ["journal_id"], name: "index_stories_on_journal_id", using: :btree
  end

  create_table "story_parts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "story_id",                   null: false
    t.string   "component_type",             null: false
    t.uuid     "component_id",               null: false
    t.integer  "position",       default: 1, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["component_type", "component_id"], name: "index_story_parts_on_component_type_and_component_id", unique: true, using: :btree
    t.index ["story_id"], name: "index_story_parts_on_story_id", using: :btree
  end

  create_table "text_components", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text     "body"
    t.text     "formatted_body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "media", "media_components", on_delete: :restrict
  add_foreign_key "milestone_types", "milestone_categories", on_delete: :restrict
  add_foreign_key "stories", "journals", on_delete: :restrict
  add_foreign_key "story_parts", "stories", on_delete: :restrict
end
