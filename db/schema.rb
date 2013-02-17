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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130217171858) do

  create_table "authentications", :force => true do |t|
    t.integer "user_id"
    t.string  "uid"
    t.string  "provider"
    t.string  "token"
    t.string  "secret"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.string   "question"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "blog_name"
    t.string   "blog_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_blogs", ["user_id"], :name => "index_user_blogs_on_user_id", :unique => true

  create_table "user_questions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "location"
    t.date     "occured"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "tumblr_id"
  end

  create_table "users", :force => true do |t|
    t.string   "tumblr_uid"
    t.string   "nickname"
    t.string   "avatar"
    t.string   "persistence_token",                 :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
