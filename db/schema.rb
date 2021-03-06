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

ActiveRecord::Schema.define(version: 20150713101737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_images", force: true do |t|
    t.integer  "article_id"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_sources", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "vk_link"
    t.string   "xpath"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "articles", force: true do |t|
    t.string   "url_title"
    t.string   "page_title"
    t.string   "article_title"
    t.text     "article_body"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "preview_url"
    t.string   "main_category_title", default: "world"
    t.integer  "article_source_id"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "page_title"
  end

  create_table "category_articles", force: true do |t|
    t.integer  "category_id"
    t.integer  "article_id"
    t.integer  "rating",      default: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vk_groups", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yandex_sources", force: true do |t|
    t.string "title"
    t.string "url"
    t.string "category"
  end

end
