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

ActiveRecord::Schema.define(:version => 20130709131849) do

  create_table "owners", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "owners", ["email"], :name => "index_owners_on_email", :unique => true
  add_index "owners", ["reset_password_token"], :name => "index_owners_on_reset_password_token", :unique => true

  create_table "reservations", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
    t.string   "email"
    t.datetime "date_time"
    t.string   "message"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "phone"
    t.string   "pdf"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "owner_id"
  end

end
