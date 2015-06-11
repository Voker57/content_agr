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

ActiveRecord::Schema.define(version: 20150610195059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "url_title"
    t.string   "page_title"
    t.string   "article_title"
    t.text     "article_body"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "root"
    t.integer  "root_rating"
    t.boolean  "news"
    t.integer  "news_rating"
    t.boolean  "world"
    t.integer  "world_rating"
    t.boolean  "russian"
    t.integer  "russian_rating"
    t.boolean  "social"
    t.integer  "social_rating"
    t.boolean  "political"
    t.integer  "political_rating"
    t.boolean  "business"
    t.integer  "business_rating"
    t.boolean  "science"
    t.integer  "science_rating"
    t.boolean  "sport"
    t.integer  "sport_rating"
    t.boolean  "hot"
    t.integer  "hot_rating"
    t.boolean  "top_read"
    t.integer  "top_read_rating"
    t.boolean  "top_video"
    t.integer  "top_video_rating"
    t.boolean  "top_speak"
    t.integer  "top_speak_rating"
    t.boolean  "interview"
    t.integer  "interview_rating"
    t.string   "preview_url"
  end

end
