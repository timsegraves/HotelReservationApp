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

ActiveRecord::Schema.define(:version => 20130308031803) do

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "room_type_id", :null => false
    t.date     "date",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "notifications", ["room_type_id", "user_id", "date"], :name => "index_notifications_on_room_type_id_and_user_id_and_date", :unique => true

  create_table "reservations", :force => true do |t|
    t.integer  "room_id",    :null => false
    t.integer  "user_id",    :null => false
    t.date     "date",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reservations", ["room_id", "date"], :name => "index_reservations_on_room_id_and_date", :unique => true
  add_index "reservations", ["user_id", "date"], :name => "index_reservations_on_user_id_and_date"

  create_table "room_types", :force => true do |t|
    t.string   "name",                                      :null => false
    t.text     "description",                               :null => false
    t.string   "photo"
    t.float    "price",                                     :null => false
    t.integer  "beds",                                      :null => false
    t.string   "bed_size",                                  :null => false
    t.boolean  "handicapped_accessible", :default => false, :null => false
    t.boolean  "non_smoking",            :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "room_types", ["name"], :name => "index_room_types_on_name", :unique => true

  create_table "rooms", :force => true do |t|
    t.integer  "number",       :null => false
    t.integer  "room_type_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "rooms", ["number"], :name => "index_rooms_on_number", :unique => true
  add_index "rooms", ["room_type_id"], :name => "index_rooms_on_room_type_id"

  create_table "users", :force => true do |t|
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
